dofile(vim.g.base46_cache .. "lsp")
require "nvchad.lsp"

local M = {}
local utils = require "core.utils"

-- export on_attach & capabilities for custom lspconfigs

M.on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false

    utils.load_mappings("lspconfig", { buffer = bufnr })

    if client.server_capabilities.signatureHelpProvider then
        require("nvchad.signature").setup(client)
    end

    if not utils.load_config().ui.lsp_semantic_tokens and client.supports_method "textDocument/semanticTokens" then
        client.server_capabilities.semanticTokensProvider = nil
    end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
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
lspconfig.lua_ls.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,

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

local util = require "lspconfig/util"

--  Go
lspconfig.gopls.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
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
                fieldalignment = true,
                nilness = true,
                unusedwrite = true,
            },
        },
    },
}

-- Json
lspconfig.jsonls.setup {}

-- Python
lspconfig.pyright.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    filetypes = { "python" },
    -- filetypes = { "python" },
    analysis = {
        autoImportCompletions = true,
        autoSearchPaths = true,
        diagnosticMode = "workspace", -- openFilesOnly, workspace
        typeCheckingMode = "basic", -- off, basic, strict
        useLibraryCodeForTypes = true,
    },
    disableOrganizeImports = false,
    disableLanguageServices = false,
}

-- Javascript
lspconfig.tsserver.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    init_options = {
        preferences = {
            disableSuggestions = false,
        },
    },
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
    end,
})

return M
