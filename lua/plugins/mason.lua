return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "lua-language-server",
      "stylua",

      "gopls",
      "goimports",

      "biome",
      "prettier",
      "typescript-language-server",
      "tailwindcss-language-server",

      "clang-format",
      "pyright",

      "json-lsp",
      "yaml-language-server",

      "sql-formatter",
      "sqls",
      --      "jdtls",
    },
  },
}
