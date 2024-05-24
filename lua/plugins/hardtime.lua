return {
  "m4xshen/hardtime.nvim",
  dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  enabled = false,
  init = function()
    require("hardtime").setup()
  end,
  opts = {},
}
