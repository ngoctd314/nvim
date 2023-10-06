---@type ChadrcConfig
local O = {}

---@type Base46HLGroupsList
O.override = {
  -- CursorLine = { bg = "#353342" },
  Comment = {
    italic = true,
  },
}

O.override = {
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
O.add = {
  -- NvimTreeOpenedFolderName = { fg = "green", bold = true },
  GitSignsCurrentLineBlame = { fg = "#707070" },
  TroubleNormal = { fg = "#c6c8d1", bg = "#181825" },
  TroubleText = { fg = "#c6c8d1", bg = "" },
  IlluminatedWordText = { fg = "#FFFFFF", bg = "#fab387" },
}

local M = {}

M.ui = {
  theme = "catppuccin",
  theme_toggle = { "catppuccin", "one_light" },
}

if M.ui.theme == "catppuccin" then
  M.ui.hl_override = O.override
  M.ui.add = O.add
end

M.plugins = "custom.plugins"

return M
