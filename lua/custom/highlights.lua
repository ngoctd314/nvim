-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = {
    italic = true,
  },
  CursorLine = { bg = "#353342" },
  NormalFloat = { bg = "#181825" },
  ColorColumn = { bg = "#222235" },
  Normal = { fg = "#c6c8d1", bg = "#181825" },
  NvimTreeNormal = { fg = "#c6c8d1", bg = "#1e1e2e" },
  NvimTreeNormalNC = { fg = "#c6c8d1", bg = "#1e1e2e" },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
  GitSignsCurrentLineBlame = { fg = "#707070" },
}

return M
