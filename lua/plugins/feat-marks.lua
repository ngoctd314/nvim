return {
  "ngoctd314/feat-marks.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = false,
  init = function()
    require("feat-marks").setup {}
  end,
}
