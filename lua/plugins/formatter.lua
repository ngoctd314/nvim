local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "gofmt", "goimports" },
    java = { "clang-format" },
    javascript = { "clang-format" },
    python = { "clang-format" },
    yaml = { "prettier" },
    yml = { "prettier" },
    -- xml = { "lemminx" },
    -- html = { "prettier" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  config = function()
    require("conform").setup(options)
  end,
}
