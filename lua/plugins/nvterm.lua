local map = vim.keymap.set

map({ "n", "t" }, "<C-t>", function()
  require("nvchad.term").toggle { pos = "sp", id = "floatTerm" }
end, { desc = "Terminal Toggle Floating term" })

map({ "i", "t" }, "<ESC>", "<C-\\><C-n>", { desc = "Terminal normal mode" })

map({ "t" }, "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Move up" })
map({ "t" }, "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Move down" })
-- map({ "t" }, "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Move right" })
-- map({ "t" }, "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Move left" })

return {}
