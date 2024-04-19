return {
  {
    "ngoctd314/marks.nvim",
    enabled = true,
    init = function()
      require("marks").setup {
        -- whether to map keybinds or not. default true
        default_mappings = false,
        -- which builtin marks to show. default {}
        builtin_marks = {},
        -- whether movements cycle back to the beginning/end of buffer. default true
        cyclic = true,
        -- whether the shada file is updated after modifying uppercase marks. default false
        force_write_shada = false,
        -- how often (in ms) to redraw signs/recompute mark positions.
        -- higher values will have better performance but may cause visual lag,
        -- while lower values may cause performance penalties. default 150.
        refresh_interval = 150,
        -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
        -- marks, and bookmarks.
        -- can be either a table with all/none of the keys, or a single number, in which case
        -- the priority applies to all marks.
        -- default 10.
        sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
        -- disables mark tracking for specific filetypes. default {}
        excluded_filetypes = {},
        -- disables mark tracking for specific buftypes. default {}
        excluded_buftypes = {},
        -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
        -- sign/virttext. Bookmarks can be used to group together positions and quickly move
        -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
        -- default virt_text is "".
        bookmark_0 = {
          sign = "M",
          virt_text = "",
          -- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
          annotate = false,
        },
        mappings = {
          -- set_next = "m,",
          -- preview = "m:",
          -- set_bookmark0 = "ms",
          -- delete_bookmark0 = "mc",
          -- delete_bookmark = "md",
          -- delete_buf = "mD",
        },
      }
    end,
    config = function()
      local map = vim.keymap.set
      local marks = require "marks"
      map("n", "ml", "<cmd>BookmarksListAll<cr>", { desc = "MarksListAll" })
      map("n", "ms", function()
        marks.set_bookmark0()
      end, { desc = "set_bookmark0" })
      map("n", "mc", function()
        marks.delete_bookmark0()
      end, { desc = "set_bookmark0" })
      map("n", "md", function()
        marks.delete_bookmark()
      end, { desc = "delete_bookmark" })
      map("n", "mD", function()
        marks.delete_buf()
      end, { desc = "delete_buf" })
    end,
  },
  {
    "MattesGroeger/vim-bookmarks",
    event = "VimEnter",
    enabled = false,
    init = function()
      vim.g.bookmark_display_annotation = 1
      vim.g.bookmark_save_per_working_dir = 1
      vim.g.bookmark_annotation_sign = "M"
      vim.g.bookmark_no_default_key_mappings = 1
      vim.g.bookmark_location_list = 1
      vim.g.bookmark_show_toggle_warning = 0
    end,
    config = function()
      local map = vim.keymap.set
      map("n", "mt", "<cmd>BookmarkToggle<cr>", { desc = "BookmarkToggle" })
      map("n", "ma", "<cmd>BookmarkAnnotate<cr>", { desc = "BookmarkAnnotate" })
      map("n", "ml", "<cmd>BookmarkShowAll<cr>", { desc = "BookmarkShowAll" })
      map("n", "mc", "<cmd>BookmarkClearAll<cr>", { desc = "BookmarkClearAll" })
      map("n", "mp", "<cmd>BookmarkPrev<cr>", { desc = "BookmarkPrev" })
      map("n", "mn", "<cmd>BookmarkNext<cr>", { desc = "BookmarkNext" })
    end,
  },
}
