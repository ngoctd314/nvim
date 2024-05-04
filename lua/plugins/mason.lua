return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "lua-language-server",
      "stylua",
      "gopls",
      "goimports",
      "jdtls",
      "prettier",
      "clang-format",
      "lemminx",
    },
  },
}
