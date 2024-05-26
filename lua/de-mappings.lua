local map = vim.keymap.set

-- terminal
map("t", "<C-x>", function() end, { desc = "unuse" })

map("n", "<leader>v", function() end, { desc = "unuse" })

map({ "n", "t" }, "<A-i>", function() end, { desc = "terminal toggle floating term" })
map({ "n", "t" }, "<A-h>", function() end, { desc = "terminal new horizontal term" })
