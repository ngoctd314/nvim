-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

local pallete = {
  normal = {
    fg = "#c6c8d1",
    bg = "#171521",
    border = "#313244",
    blue = "#89b4fa",
    red = "#F38BA8",
    black = "#1E1D2D",
  },
}

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "catppuccin",
  ---@type Base46HLGroupsList
  hl_add = {
    RenamerBorder = { fg = pallete.normal.border },
    RenamerTitle = { fg = pallete.normal.red, bg = pallete.normal.bg },
  },
  ---@type Base46HLGroupsList
  hl_override = {
    Normal = { fg = pallete.normal.fg, bg = pallete.normal.bg, bold = true },

    FloatBorder = { fg = pallete.normal.border }, -- hover border
    TelescopeBorder = { fg = pallete.normal.border, bg = pallete.normal.bg },
    TelescopeNormal = { fg = pallete.normal.fg, bg = pallete.normal.bg },
    TelescopeSelection = { fg = pallete.normal.fg, bg = "#222235" },
    TelescopePromptNormal = { fg = pallete.normal.fg, bg = pallete.normal.bg },
    TelescopePromptPrefix = { bg = pallete.normal.bg },
    TelescopePromptBorder = { bg = pallete.normal.bg },
    -- TelescopePromptTitle = { fg = pallete.normal.blue, bg = pallete.normal.bg },
    -- TelescopePreviewTitle = { fg = pallete.normal.blue, bg = pallete.normal.bg },
    -- TelescopeResultsTitle = { fg = pallete.normal.blue, bg = pallete.normal.bg },

    NormalFloat = { bg = pallete.normal.bg },

    NvimTreeNormal = { fg = pallete.normal.fg, bg = pallete.normal.bg },
    NvimTreeNormalNC = { fg = pallete.normal.fg, bg = pallete.normal.bg },
    NvimTreeWinSeparator = { fg = pallete.normal.border, bg = pallete.normal.bg },
    Folded = { fg = pallete.normal.border, bg = pallete.normal.bg },
  },
  statusline = {
    theme = "vscode", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "default",
    overriden_modules = nil,
  },
  tabufline = {
    enabled = true,
    lazyload = true,
    order = { "treeOffset", "buffers", "tabs" },
    -- order = { "treeOffset", "buffers", "tabs", "btns" },
    modules = nil,
  },
}

return M
