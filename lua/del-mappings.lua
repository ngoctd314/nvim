local delmap = vim.keymap.del

-- terminal
delmap("t", "<C-x>")
delmap("n", "<leader>v")
delmap({ "n", "t" }, "<A-i>")
delmap({ "n", "t" }, "<A-h>")

delmap("n", "<leader>n")
