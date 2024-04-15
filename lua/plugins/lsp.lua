local conf = require("nvconfig").ui.lsp

-- export on_attach & capabilities
local on_attach = function(client, bufnr)
  -- local function opts(desc)
  --   return { buffer = bufnr, desc = desc }
  -- end

  -- map("n", "gD", vim.lsp.buf.declaration, opts "Lsp Go to declaration")
  -- map("n", "gd", vim.lsp.buf.definition, opts "Lsp Go to definition")
  -- map("n", "K", vim.lsp.buf.hover, opts "Lsp hover information")
  -- map("n", "gi", vim.lsp.buf.implementation, opts "Lsp Go to implementation")
  -- map("n", "<leader>sh", vim.lsp.buf.signature_help, opts "Lsp Show signature help")
  -- map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Lsp Add workspace folder")
  -- map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Lsp Remove workspace folder")

  -- map("n", "<leader>wl", function()
  --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, opts "Lsp List workspace folders")

  -- map("n", "<leader>D", vim.lsp.buf.type_definition, opts "Lsp Go to type definition")

  -- map("n", "<leader>ra", function()
  --   require "nvchad.lsp.renamer"()
  -- end, opts "Lsp NvRenamer")

  -- map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts "Lsp Code action")
  -- map("n", "gr", vim.lsp.buf.references, opts "Lsp Show references")

  -- setup signature popup
  if conf.signature and client.server_capabilities.signatureHelpProvider then
    require("nvchad.lsp.signature").setup(client, bufnr)
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

-- javascript
-- python

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(args)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[args.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = args.buf }
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if client.server_capabilities.hoverProvider then
      -- Displays hover information about the symbol under the cursor in a floating window. Calling the function twice will jump into the floating window.
      vim.keymap.set("n", "S", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "K", vim.diagnostic.open_float, { buffer = args.buf })
    end
  end,
})

return {
  "neovim/nvim-lspconfig",
  config = function() end,
}
