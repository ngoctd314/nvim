return {
  {
    "chentoast/marks.nvim",
    lazy = false,
    init = function()
      require("marks").setup {
        default_mappings = false,
        bookmark_0 = {
          sign = "M",
          virt_text = "",
          -- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
          annotate = false,
        },
      }
    end,
  },
}
