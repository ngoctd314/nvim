-- require("telescope").load_extension "media_files"
--
-- require("telescope").setup {
--   extensions = {
--     media_files = {
--       -- filetypes whitelist
--       -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
--       filetypes = { "png", "webp", "jpg", "jpeg" },
--       -- find command (defaults to `fd`)
--       find_cmd = "rg",
--     },
--   },
-- }
local actions = require "telescope.actions"
-- local action_layout = require "telescope.actions.layout"

require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = actions.cycle_history_next,
        ["<C-k>"] = actions.cycle_history_prev,
      },
    },
  },
}
