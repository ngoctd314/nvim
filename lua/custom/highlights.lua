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
  TblineFill = { bg = "#181825" },
  Normal = { fg = "#c6c8d1", bg = "#181825" },

  NvimTreeNormal = { fg = "#c6c8d1", bg = "#1e1e2e" },
  NvimTreeNormalNC = { fg = "#c6c8d1", bg = "#1e1e2e" },
  NvimTreeWinSeparator = { fg = "#1e1e2e", bg = "#1e1e2e" },
  Search = { fg = "#141414", bg = "#fab387" },

  -- StatusLine = { bg = "#ffffff" },

  -- StatusLine = { bg = "#FFFFFF", fg = "#FFFFFF" },
  -- StatusLineMode = { bg = "#FFFFFF", fg = "#FFFFFF" },
  -- St_LspInfo = { bg = "#FFFFFF", fg = "#FFFFFF" },
  -- St_TerminalMode = { bg = "#FFFFFF", fg = "#FFFFFF" },
  -- StatusLineNC = { bg = "#181825" },
  -- StatusLineMode = { fg = "#c6c8d1", bg = "#181825" },
  -- St_NormalMode = { fg = "#c6c8d1", bg = "#181825" },
  -- St_EmptySpace = { bg = "#181825" },
  -- St_EmptySpace2 = { bg = "#181825" },
  -- StatusLineMode = { fg = "#c6c8d1", bg = "#181825" },
  -- StatusLine = { bg = "#181825" },
  -- StatusLineNC = { bg = "#181825" },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
  GitSignsCurrentLineBlame = { fg = "#707070" },
  TroubleNormal = { fg = "#c6c8d1", bg = "#181825" },
  TroubleText = { fg = "#c6c8d1", bg = "" },
}

return M
