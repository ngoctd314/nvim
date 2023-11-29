local null_ls = require "null-ls"
local b = null_ls.builtins

local sources = {
    -- spell
    -- b.diagnostics.misspell,
    -- webdev stuff
    b.formatting.prettier.with { filetypes = { "html", "css", "yaml", "json" } },
    -- Lua
    b.formatting.stylua.with { filetypes = { "lua" } },
    -- Go
    b.formatting.gofmt.with { filetypes = { "go" } },
    b.formatting.goimports.with { filetypes = { "go" } },
    -- b.diagnostics.revive.with { filetypes = { "go" } },
    -- b.formatting.golines,
    -- SQL
    b.formatting.sql_formatter.with { filetypes = { "sql" } },
    -- PHP
    b.formatting.phpcsfixer.with { filetypes = { "php" } },
    -- Json
    -- b.formatting.jq.with { filetypes = { "json" } },
    -- Python
    b.diagnostics.flake8.with { filetypes = { "python" } },
    -- b.formatting.black.with { filetypes = { "python" } },
    -- b.formatting.autoflake.with { filetypes = { "python" } }, -- remove unuse import
    -- b.formatting.pyflakes.with { filetypes = { "python" } },
    -- b.diagnostics.ruff.with { filetypes = { "python" } },

    -- Javascript
    b.formatting.prettier.with { filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" } },
    -- Yaml
}
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local on_attach = function(client, bufnr)
    -- Format on save
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
