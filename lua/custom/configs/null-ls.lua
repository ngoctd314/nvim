local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- Go
  b.formatting.gofumpt,
  b.formatting.goimports,
  b.formatting.golines,
}
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local on_attach = function(client, bufnr)
  if client.supports_method "textDocument/formatting" then
    vim.api.nvim_clear_autocmds {
      group = augroup,
      buffer = bufnr,
    }
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format { bufnr = bufnr }
      end,
    })
  end
end

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = on_attach,
}

-- require("hop").setup {
--   -- keys = 'etovxqpdygfblzhckisuran'
--   keys = "qwertyuiopasdfghjklzxcvbnm",
-- }

-- -- map navigation
-- vim.api.nvim_set_keymap("n", "s", ":HopChar1<CR>", { noremap = true })
