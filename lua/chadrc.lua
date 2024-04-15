-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

local pallete = {
  normal = {
    fg = "#c6c8d1",
    bg = "#171521", -- "#16121C"
  },
}

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "catppuccin",
  ---@type Base46HLGroupsList
  hl_override = {
    Normal = { fg = pallete.normal.fg, bg = pallete.normal.bg, bold = true },
    -- Comment = { italic = true },
    -- ["@comment"] = { italic = true },
    -- TblineFill = { fg = "white", bg = pallete.normal.bg },
    -- TbLineBufOn = { fg = "red", bg = pallete.normal.bg },
    -- TbLineBufOnClose = { bg = pallete.normal.bg },
    -- TbLineBufOff = { bg = pallete.normal.bg },
    -- TbLineBufOffClose = { bg = pallete.normal.bg },
    -- TbLineThemeToggleBtn = { bg = pallete.normal.bg },
    -- TbLineBufOnModified = { bg = pallete.normal.bg },
    -- TBTabTitle = { fg = "white", bg = pallete.normal.bg },
    -- TbLineTabOn = { fg = "white", bg = pallete.normal.bg },
    -- TbLineTabOff = { fg = "white", bg = pallete.normal.bg },
    -- BufferLineFill = { fg = "white", bg = pallete.normal.bg },
    -- BufferLineTabSelected = { fg = "white", bg = pallete.normal.bg },
    -- BufferLineBackground = { fg = "white", bg = pallete.normal.bg },
    -- BufferLineTab = { fg = "white", bg = pallete.normal.bg },

    -- TbBufLineBufOffModified = { bg = pallete.normal.bg },
    -- TblineTabNewBtn = { bg = pallete.normal.bg },
    -- TbLineTabOn = { bg = pallete.normal.bg },
    -- TbLineTabOff = { bg = pallete.normal.bg },
    -- TbLineTabCloseBtn = { bg = pallete.normal.bg },
    -- TbLineCloseAllBufsBtn = { bg = pallete.normal.bg },
    -- TBTabTitle = { bg = pallete.normal.bg },
    FloatBorder = { fg = "#313244" }, -- hover border
    TelescopeBorder = { fg = "#313244", bg = pallete.normal.bg },
    TelescopeNormal = { fg = pallete.normal.fg, bg = pallete.normal.bg },
    TelescopeSelection = { fg = pallete.normal.fg, bg = "#222235" },
    TelescopePromptNormal = { fg = pallete.normal.fg, bg = pallete.normal.bg },
    TelescopePromptPrefix = { bg = pallete.normal.bg },
    TelescopePromptBorder = { bg = pallete.normal.bg },
    NormalFloat = { bg = pallete.normal.bg },

    -- St_file_info = { bg = pallete.normal.bg },
    -- St_file_sep = { bg = pallete.normal.bg },
    -- St_gitIcons = { bg = pallete.normal.bg },
    -- St_LspStatus = { bg = pallete.normal.bg },
    -- St_cwd_text = { bg = pallete.normal.bg },
    -- St_pos_text = { bg = pallete.normal.bg },

    NvimTreeNormal = { fg = pallete.normal.fg, bg = pallete.normal.bg },
    NvimTreeNormalNC = { fg = pallete.normal.fg, bg = pallete.normal.bg },
    NvimTreeWinSeparator = { fg = "#313244", bg = pallete.normal.bg },
    -- WinSeparator = { fg = "#353342", bg = "#181825" },
    Folded = { fg = "#313244", bg = pallete.normal.bg },
  },
  statusline = {
    theme = "vscode", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "default",
    overriden_modules = nil,
  },
}

return M
