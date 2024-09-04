return {
  "echasnovski/mini.nvim",
  version = "*",
  init = function()
    require("mini.surround").setup {
      mappings = {
        add = "<leader>sa", -- Add surrounding in Normal and Visual modes
        replace = "<leader>sr", -- Replace surrounding
        delete = "<leader>sd", -- Delete surrounding
        -- find = "sf", -- Find surrounding (to the right)
        -- find_left = "sF", -- Find surrounding (to the left)
        -- highlight = "sh", -- Highlight surrounding
        -- update_n_lines = "sn", -- Update `n_lines`
        -- suffix_last = "l", -- Suffix to search with "prev" method
        -- suffix_next = "n", -- Suffix to search with "next" method
      },
    }
  end,
}
