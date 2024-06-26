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
          -- virt_text = "",
          -- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
          annotate = false,
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
      end, { desc = "delete_bookmark0" })
      map("n", "md", function()
        marks.delete_bookmark()
      end, { desc = "delete_bookmark" })
      map("n", "mD", function()
        marks.delete_buf()
      end, { desc = "delete_buf" })
    end,
  },
}
