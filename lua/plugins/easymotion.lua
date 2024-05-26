return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    enabled = false,
    ---@type Flash.Config
    opts = {},
  -- stylua: ignore
    keys = {
      -- { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      -- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    },
    config = function()
      -- vim.api.nvim_set_hl(0, "FlashCurrent", { fg = "#89b4fa", bg = "#171521" })
      -- vim.api.nvim_set_hl(0, "FlashCursor", { fg = "#89b4fa" })
      -- vim.api.nvim_set_hl(0, "FlashMatch", { fg = "#89b4fa" })
      -- vim.api.nvim_set_hl(0, "FlashLabel", { fg = "#ab003c" })
      -- vim.api.nvim_set_hl(0, "FlashBackdrop", { fg = "#89b4fa" })
      -- vim.api.nvim_set_hl(0, "FlashPrompt", { fg = "#89b4fa" })
      -- vim.api.nvim_set_hl(0, "FlashPromptIcon", { fg = "#89b4fa" })
    end,
  },
  {

    "phaazon/hop.nvim", -- easymotion
    lazy = false,
    enabled = true,
    config = function()
      require("hop").setup {
        keys = "qwertyuiopasdfghjklzxcvbnm",
      }

      -- map navigation
      vim.api.nvim_set_keymap("n", "s", "ma:HopChar1<CR>", { noremap = true })
    end,
  },
}
