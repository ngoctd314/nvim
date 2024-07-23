return {
  "olexsmir/gopher.nvim",
  lazy = true,
  ft = "go",
  config = function()
    require("gopher").setup {
      commands = {
        go = "go",
        gomodifytags = "gomodifytags",
        gotests = "gotests", -- also you can set custom command path
        impl = "impl",
        iferr = "iferr",
      },
    }
  end,
}
