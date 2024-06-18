return {
  "neovim/nvim-lspconfig",
  config = function()
    local conf = require("nvconfig").ui.lsp

    -- export on_attach & capabilities
    local on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false

      local map = vim.keymap.set
      local function opts(desc)
        return { buffer = bufnr, desc = desc }
      end

      map("n", "<leader>rn", function()
        vim.lsp.buf.rename()
      end, opts "Lsp NvRenamer")

      -- setup signature popup
      if conf.signature and client.server_capabilities.signatureHelpProvider then
        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
          border = "single",
          max_width = 60,
          focusable = false,
          relative = "cursor",
          silent = true,
        })

        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
          border = "single",
          max_width = 60,
          focusable = false,
          relative = "cursor",
          silent = true,
        })
        local group = vim.api.nvim_create_augroup("LspSignature", { clear = false })
        vim.api.nvim_clear_autocmds { group = group, buffer = bufnr }

        local triggerChars = client.server_capabilities.signatureHelpProvider.triggerCharacters

        local check_triggeredChars = function(triggerCharsParams)
          local cur_line = vim.api.nvim_get_current_line()
          local pos = vim.api.nvim_win_get_cursor(0)[2]

          cur_line = cur_line:gsub("%s+$", "") -- rm trailing spaces

          for _, char in ipairs(triggerCharsParams) do
            if cur_line:sub(pos, pos) == char then
              return true
            end
          end
        end
        vim.api.nvim_create_autocmd("TextChangedI", {
          group = group,
          buffer = bufnr,
          callback = function()
            if check_triggeredChars(triggerChars) then
              vim.lsp.buf.signature_help()
            end
          end,
        })
        --
      end
    end

    -- disable semanticTokens
    local on_init = function(client, _)
      if client.supports_method "textDocument/semanticTokens" then
        client.server_capabilities.semanticTokensProvider = nil
      end
    end

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem = {
      documentationFormat = { "markdown", "plaintext" },
      snippetSupport = true,
      preselectSupport = true,
      insertReplaceSupport = true,
      labelDetailsSupport = true,
      deprecatedSupport = true,
      commitCharactersSupport = true,
      tagSupport = { valueSet = { 1 } },
      resolveSupport = {
        properties = {
          "documentation",
          "detail",
          "additionalTextEdits",
        },
      },
    }

    local lspconfig = require "lspconfig"
    local servers = { "html", "cssls" }

    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
      }
    end

    local util = require "lspconfig/util"

    -- golang
    lspconfig.gopls.setup {
      on_init = on_init,
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = { "gopls" },
      filetypes = { "go", "gomod", "gowork", "gotmpl" },
      root_dir = util.root_pattern("go.work", "go.mod", ".git"),
      settings = {
        gopls = {
          usePlaceholders = false, -- auto add input params, never use it
          analyses = {
            unusedparams = true,
            unreachable = true,
            shadow = true,
            -- memory alignment
            fieldalignment = true,
            nilness = true,
            unusedwrite = true,
          },
          staticcheck = true,
        },
      },
    }

    -- java
    lspconfig.jdtls.setup {
      on_init = on_init,
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "java" },
    }

    -- lua
    lspconfig.lua_ls.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      on_init = on_init,

      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = {
              [vim.fn.expand "$VIMRUNTIME/lua"] = true,
              [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
              [vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types"] = true,
              [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
            },
            maxPreload = 100000,
            preloadFileSize = 10000,
          },
        },
      },
    }

    -- xml
    lspconfig.lemminx.setup {
      on_init = on_init,
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "xml" },
    }

    -- sql
    lspconfig.sqls.setup {
      on_init = on_init,
      on_attach = on_attach,
      settings = {
        sqls = {
          connections = {
            {
              driver = "mysql",
              dataSourceName = "root:secret@tcp(192.168.49.2:30300)/ataodev",
            },
          },
        },
      },
      capabilities = capabilities,
      filetypes = { "sql" },
      root_dir = function(_)
        return vim.loop.cwd()
      end,
    }

    -- javascript
    -- python

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(args)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[args.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if client ~= nil and client.server_capabilities.hoverProvider then
          -- Displays hover information about the symbol under the cursor in a floating window. Calling the function twice will jump into the floating window.
          vim.diagnostic.config {
            float = { border = "single" },
          }
          vim.keymap.set("n", "S", vim.lsp.buf.hover, { buffer = args.buf, desc = "lsp.hover" })
          vim.keymap.set("n", "K", vim.diagnostic.open_float, { buffer = args.buf })
        end
      end,
    })

    local signs = {
      Error = "E",
      Warn = "W",
      Hint = "H",
      Infor = "I",
    }

    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    local error_color = "#ff2852"
    vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = error_color })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = error_color })
  end,
}
