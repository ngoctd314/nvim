return {
  "tomasky/bookmarks.nvim",
  -- after = "telescope.nvim",
  event = "VimEnter",
  enabled = false,
  config = function()
    -- local hash = string.gsub(vim.fn["getcwd"](), "/", "_")

    require("bookmarks").setup {
      -- sign_priority = 8,  --set bookmark sign priority to cover other sign

      save_file = vim.fn.expand "$HOME/.bookmarks", -- bookmarks save file path
      -- save_file = vim.fn.expand(string.format("$HOME/.cache/nvim/bookmark/.%s", hash)), -- bookmarks save file path
      signs = {
        -- add = { hl = "BookMarksAdd", text = "", numhl = "BookMarksAddNr", linehl = "BookMarksAddLn" },
        -- ann = { hl = "BookMarksAnn", text = "", numhl = "BookMarksAnnNr", linehl = "BookMarksAnnLn" },
        add = { hl = "BookMarksAdd", text = "M", numhl = "BookMarksAddNr", linehl = "BookMarksAddLn" },
        ann = { hl = "BookMarksAnn", text = "M", numhl = "BookMarksAnnNr", linehl = "BookMarksAnnLn" },
      },
      on_attach = function()
        local bm = require "bookmarks"
        local map = vim.keymap.set
        map("n", "mt", bm.bookmark_toggle, { desc = "bookmark_toggle" }) -- add or remove bookmark at current line
        map("n", "me", bm.bookmark_ann, { desc = "bookmark_edit" }) -- add or edit mark annotation at current line
        map("n", "mc", bm.bookmark_clean, { desc = "bookmark_clean" }) -- clean all marks in local buffer
        map("n", "ml", bm.bookmark_list) -- show marked file list in quickfix window
      end,
    }
  end,
}
