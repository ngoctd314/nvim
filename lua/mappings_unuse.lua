local map = vim.keymap.set

-- terminal
map("t", "<C-x>", function() end, { desc = "unuse" })

map("n", "<leader>v", function() end, { desc = "unuse" })

-- toggleable
map({ "n", "t" }, "<A-v>", function() end, { desc = "unuse" })
map({ "n", "t" }, "<A-h>", function() end, { desc = "unuse" })
map({ "n", "t" }, "<A-i>", function() end, { desc = "unuse" })

map("t", "<ESC>", function() end, { desc = "unuse" })
