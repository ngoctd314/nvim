local map = vim.keymap.set

-- terminal
map("t", "<C-x>", function() end, { desc = "unuse" })

map("n", "<leader>v", function() end, { desc = "unuse" })

map({ "n", "t" }, "<A-i>", function() end, { desc = "terminal toggle floating term" })
map({ "n", "t" }, "<A-h>", function() end, { desc = "terminal new horizontal term" })

vim.api.nvim_create_user_command("Nvtermvsp", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm", split_ratio = 1.0 }
end, { desc = "terminal toggleable vertical term" })

-- nvterm
map({ "n", "t" }, "<C-t>", function()
  require("nvchad.term").toggle { pos = "sp", id = "floatTerm" }
end, { desc = "Terminal Toggle Floating term" })

map({ "i", "t" }, "<ESC>", "<C-\\><C-n>", { desc = "Terminal Toggle mode" })

return {}
