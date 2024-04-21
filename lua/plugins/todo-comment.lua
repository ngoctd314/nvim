return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = { "TodoTelescope" },
  lazy = false,
  config = true,
  enable = false,
  init = function()
    require("todo-comments").setup {}
  end,
}
