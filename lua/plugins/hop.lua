return {
  "phaazon/hop.nvim", -- easymotion
  lazy = false,
  config = function()
    require("hop").setup {
      keys = "qwertyuiopasdfghjklzxcvbnm",
    }

    -- map navigation
    vim.api.nvim_set_keymap("n", "s", "ma:HopChar1<CR>", { noremap = true })
  end,
}
