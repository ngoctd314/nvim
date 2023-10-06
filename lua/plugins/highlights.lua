-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

---@class ChadrcConfig
local M = {}

---@type Base46HLGroupsList
M.override = {
  NormalFloat = { bg = "#181825" },
  ColorColumn = { bg = "#222235" },
  TblineFill = { bg = "#181825" },
  Normal = { fg = "#c6c8d1", bg = "#181825" },

  NvimTreeNormal = { fg = "#c6c8d1", bg = "#181825" },
  NvimTreeNormalNC = { fg = "#c6c8d1", bg = "#181825" },
  Search = { fg = "#141414", bg = "#fab387" },
  WinSeparator = { fg = "#353342", bg = "#181825" },
  NvimTreeWinSeparator = { fg = "#353342", bg = "#181825" },
}
---@type HLTable
M.add = {
  -- NvimTreeOpenedFolderName = { fg = "green", bold = true },
  GitSignsCurrentLineBlame = { fg = "#707070" },
  TroubleNormal = { fg = "#c6c8d1", bg = "#181825" },
  TroubleText = { fg = "#c6c8d1", bg = "" },
  IlluminatedWordText = { fg = "#FFFFFF", bg = "#fab387" },
}

return M
