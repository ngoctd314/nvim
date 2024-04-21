return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "lua-language-server",
      "stylua",
      "gopls",
      "gofmt",
      "goimports",
      "jdtls",
      "prettier",
      "clang-format",
    },
  },
}
