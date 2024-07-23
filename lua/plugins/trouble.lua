return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  enabled = false,
  opts = {
    position = "bottom", -- position of the list can be: bottom, top, left, right
    height = 15, -- height of the trouble list when position is top or bottom
    icons = false,
    group = false, -- group results by file
    indent_lines = false, -- add an indent guide below the fold icons
    padding = false,
    signs = {
      -- icons / text used for a diagnostic
      other = "M",
    },
    use_diagnostic_signs = true,
  },
}
