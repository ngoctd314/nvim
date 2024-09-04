local pallete = {
  fg = "#c6c8d1",
  bg500 = "#191919",
  bg400 = "#1e1e1e",
  bg300 = "#222222",
  -- bg300 = "#292929",
  border = "#313244",
  red500 = "#ec6b64",
  red600 = "#ff2852",
}

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "gruvchad",
  ---@type Base46HLGroupsList
  hl_add = {
    RenamerBorder = { fg = pallete.bg300, bg = pallete.bg300 },
    RenamerTitle = { bg = pallete.bg300, fg = pallete.red500 },
    DapBreakpoint = { fg = pallete.red500 },
    DapLogPoint = { fg = "#61afef" },
    DapStopped = { fg = "#98c379" },
    DiagnosticSignError = { fg = pallete.red500 },
    DiagnosticError = { fg = pallete.red500 },
    DiagnosDiagnosticSignError = { fg = pallete.red600 },
  },
  ---@type Base46HLGroupsList
  hl_override = {
    Normal = { bg = pallete.bg500, bold = false },
    WinSeparator = { fg = pallete.bg400, bg = pallete.bg400 },
    FloatBorder = { fg = pallete.bg300, bg = pallete.bg300 },
    NormalFloat = { bg = pallete.bg300 },
    CmpDoc = { bg = pallete.bg300 },
    CmpPmenu = { bg = pallete.bg300 },
    QuickFixLine = { bg = pallete.bg500 },

    TelescopePromptNormal = { fg = pallete.fg, bg = pallete.bg400 },
    TelescopePromptPrefix = { bg = pallete.bg400 },
    TelescopePromptBorder = { fg = pallete.bg400, bg = pallete.bg400 },
    TelescopeNormal = { bg = pallete.bg400 },
    TelescopeBorder = { fg = pallete.bg400, bg = pallete.bg400 },

    NvimTreeNormal = { bg = pallete.bg400 },
    NvimTreeNormalNC = { bg = pallete.bg400 },
    NvimTreeWinSeparator = { bg = pallete.bg400, fg = pallete.bg400 },

    Folded = { fg = pallete.border, bg = pallete.bg500 },
  },
  statusline = {
    theme = "vscode", -- default/vscode/vscode_colored/minimal
    separator_style = "default",
    overriden_modules = nil,
  },
  tabufline = {
    enabled = true,
    lazyload = true,
    order = { "treeOffset", "buffers", "tabs" },
    modules = nil,
  },
  term = {
    float = {
      relative = "editor",
      row = 0.22,
      col = 0.2,
      width = 0.6,
      height = 0.5,
      border = "single",
    },
  },
}

return M
