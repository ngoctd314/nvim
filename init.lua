vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "ngoctd314/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

local autocmd = vim.api.nvim_create_autocmd
-- auto fold
autocmd("BufWinLeave", {
  pattern = "*",
  command = "silent! mkview",
})

autocmd("BufWinEnter", {
  pattern = "*",
  command = "silent! loadview",
})

autocmd("TermOpen", {
  pattern = "*",
  command = "setlocal nonumber norelativenumber cursorline nospell",
})

autocmd("FileType", {
  pattern = "qf",
  command = "setlocal nospell",
})

vim.schedule(function()
  require "mappings"
  require "del-mappings"
end)

require "configs.treesitter"
require "configs.harpoon"
