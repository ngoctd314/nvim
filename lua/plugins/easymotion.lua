return {
  {
    "phaazon/hop.nvim", -- easymotion
    lazy = false,
    config = function()
      require("hop").setup {
        keys = "qwertyuiopasdfghjklzxcvbnm",
      }

      -- map navigation
      vim.keymap.set({ "n", "v" }, "s", "ma<cmd>HopChar1<CR>")
    end,
  },
}
