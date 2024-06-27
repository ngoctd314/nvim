local harpoon = require "harpoon"

harpoon:setup()

local map = vim.keymap.set

map("n", "<leader>h", function() end, { desc = "harpoon" })
map("n", "<leader>ha", function()
  harpoon:list():add()
end, { desc = "harpoon add" })
map("n", "<leader>hl", function()
  harpoon.ui:toggle_quick_menu(harpoon:list(), {
    ui_max_width = 164,
    ui_max_height = 30,
    title = "",
  })
end, { desc = "harpoon list" })

map("n", "<leader>h1", function()
  harpoon:list():select(1)
end, { desc = "harpoon select(1)" })
map("n", "<leader>h2", function()
  harpoon:list():select(2)
end, { desc = "harpoon select(2)" })
map("n", "<leader>h3", function()
  harpoon:list():select(3)
end, { desc = "harpoon select(3)" })
map("n", "<leader>h4", function()
  harpoon:list():select(4)
end, { desc = "harpoon select(4)" })
