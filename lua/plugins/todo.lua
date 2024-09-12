return {
  "ngoctd314/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  enable = true,
  opt = {},
  lazy = false,
  init = function()
    require("todo-comments").setup {}
  end,
}
