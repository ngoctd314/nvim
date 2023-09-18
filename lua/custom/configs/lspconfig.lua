local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

--  Go
lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      -- usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}

-- Python
lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
}

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
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
      -- vim.keymap.set('n', 'K', vim.diagnostic.open_float, { buffer = args.buf })
    end
    if client.server_capabilities.codeActionProvider then
      -- Selects a code action available at the current cursor position.
      -- vim.keymap.set("n", "<leader>q", vim.lsp.buf.code_action, opts)
    end
  end,
})
