-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

---@class ChadrcConfig
local M = {}

local pallete = {
    normal = {
        fg = "#c6c8d1",
        bg = "#171521",
    },
}

---@type Base46HLGroupsList
M.override = {
    TblineFill = { bg = pallete.normal.bg },
    TbLineBufOn = { fg = "red", bg = pallete.normal.bg },
    TbLineBufOnClose = { bg = pallete.normal.bg },
    TbLineBufOff = { bg = pallete.normal.bg },
    TbLineBufOffClose = { bg = pallete.normal.bg },
    TbLineThemeToggleBtn = { bg = pallete.normal.bg },
    TbLineBufOnModified = { bg = pallete.normal.bg },

    Normal = { fg = pallete.normal.fg, bg = pallete.normal.bg, bold = true },
    TelescopeBorder = { fg = "#353342", bg = pallete.normal.bg },
    TelescopeNormal = { fg = pallete.normal.fg, bg = pallete.normal.bg },
    TelescopeSelection = { fg = pallete.normal.fg, bg = "#222235" },
    TelescopePromptNormal = { fg = pallete.normal.fg, bg = pallete.normal.bg },
    TelescopePromptPrefix = { bg = pallete.normal.bg },
    NormalFloat = { bg = pallete.normal.bg },

    -- St_file_info = { bg = pallete.normal.bg },
    St_file_sep = { bg = pallete.normal.bg },
    St_gitIcons = { bg = pallete.normal.bg },
    St_LspStatus = { bg = pallete.normal.bg },
    St_cwd_text = { bg = pallete.normal.bg },
    St_pos_text = { bg = pallete.normal.bg },

    NvimTreeNormal = { fg = "#c6c8d1", bg = pallete.normal.bg },
    NvimTreeNormalNC = { fg = "#c6c8d1", bg = pallete.normal.bg },
    NvimTreeWinSeparator = { fg = "#353342", bg = pallete.normal.bg },
    -- WinSeparator = { fg = "#353342", bg = "#181825" },
}
---@type HLTable
M.add = {
    -- NvimTreeOpenedFolderName = { fg = "green", bold = true },
    GitSignsCurrentLineBlame = { fg = "#707070" },
    -- TroubleNormal = { fg = "#c6c8d1", bg = "#181825" },
    -- TroubleText = { fg = "#c6c8d1", bg = "" },
}

return M
