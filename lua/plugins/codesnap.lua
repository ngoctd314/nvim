return {
  "mistricky/codesnap.nvim",
  build = "make",
  lazy = false,
  keys = {
    { "<leader>cc", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
    { "<leader>cs", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
  },
  opts = {
    save_path = "~/Pictures",
    has_breadcrumbs = true,
    bg_theme = "bamboo",
  },
  config = function()
    require("codesnap").setup {
      has_breadcrumbs = true,
      show_workspace = false,
      has_line_number = true,
      bg_color = "#535c68",
      watermark = "",
      min_width = 0,
    }
  end,
}
