return {
  "stevearc/dressing.nvim",
  opts = {},
  config = function()
    require("dressing").setup {
      input = {
        enabled = true,
        title_pos = "center", -- Can be 'left', 'right', or 'center'
        start_in_insert = true,
        border = "rounded",
        -- 'editor' and 'win' will default to being centered
        relative = "cursor",
        mappings = {
          n = {
            ["<Esc>"] = "Close",
            ["<CR>"] = "Confirm",
          },
          i = {
            ["<CR>"] = "Confirm",
            ["<Up>"] = "HistoryPrev",
            ["<Down>"] = "HistoryNext",
          },
        },
        override = function(conf)
          conf.col = -1
          conf.row = 0
          return conf
        end,
      },
    }
  end,
}
