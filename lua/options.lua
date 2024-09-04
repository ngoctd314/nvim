require "nvchad.options"

-- add yours here!

local opt = vim.o
opt.number = true
opt.relativenumber = true
opt.timeoutlen = 0
opt.expandtab = true
opt.smartindent = true
opt.spell = true
opt.spelllang = "en"
opt.updatetime = 0

-- wrap text at the end of the line
vim.wo.wrap = true
vim.wo.linebreak = true

-- opt.cursorline = true
-- opt.cursorlineopt = "both" -- to enable cursorline!
