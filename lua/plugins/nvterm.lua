local map = vim.keymap.set

-- terminal
map("t", "<C-x>", function() end, { desc = "unuse" })

map("n", "<leader>v", function() end, { desc = "unuse" })

map({ "n", "t" }, "<A-i>", function() end, { desc = "terminal toggle floating term" })
map({ "n", "t" }, "<A-h>", function() end, { desc = "terminal new horizontal term" })

-- vim.api.nvim_create_user_command("Termvsp", function()
--   require("nvchad.term").new { pos = "vsp" }
-- end, { desc = "terminal toggleable vertical term" })
-- vim.api.nvim_create_user_command("Termsp", function()
--   require("nvchad.term").new { pos = "sp" }
-- end, { desc = "terminal toggleable horizontal term" })
--
-- -- nvterm
map({ "n", "t" }, "<C-t>", function()
  require("nvchad.term").toggle { pos = "sp", id = "verticalTerm" }
end, { desc = "Terminal Toggle Floating term" })

map({ "i", "t" }, "<ESC>", "<C-\\><C-n>", { desc = "Terminal normal mode" })

map({ "t" }, "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Move up" })
map({ "t" }, "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Move down" })
map({ "t" }, "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Move right" })
map({ "t" }, "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Move left" })

return {}
