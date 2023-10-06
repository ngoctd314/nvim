require("hop").setup {
  -- keys = 'etovxqpdygfblzhckisuran'
  keys = "qwertyuiopasdfghjklzxcvbnm",
}

-- map navigation
vim.api.nvim_set_keymap("n", "s", "ma:HopChar1<CR>", { noremap = true })
