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
local util = require "lspconfig/util"

local on_attach = function(_, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end
end

local popup = {
  border = "single",
  max_width = 80,
  focusable = false,
  relative = "cursor",
  silent = true,
}

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(args)
    vim.bo[args.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if client ~= nil and client.server_capabilities.hoverProvider then
      -- vim.diagnostic.config { float = popup }
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

-- LSP settings (for overriding per client)
local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, popup),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, popup),
}

return {
  "neovim/nvim-lspconfig",
  config = function()
    lspconfig.lua_ls.setup {
      on_init = on_init,
      on_attach = on_attach,
      capabilities = capabilities,
    }
    lspconfig.gopls.setup {
      handlers = handlers,
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
    lspconfig.pyright.setup {
      handlers = handlers,
      on_init = on_init,
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "py" },
    }

    -- sql
    lspconfig.sqls.setup {
      on_init = on_init,
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = { "sqls", "-config", "/home/ubuntu/.config/sqls/config.yaml" },
      filetypes = { "sql" },
    }

    -- font end
    lspconfig.tsserver.setup {
      handlers = handlers,
      on_init = on_init,
      on_attach = on_attach,
      capabilities = capabilities,
    }
    -- npm i -g vscode-langservers-extracted
    lspconfig.cssls.setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
    lspconfig.html.setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
    lspconfig.tailwindcss.setup {
      handlers = handlers,
      on_init = on_init,
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end,
}
