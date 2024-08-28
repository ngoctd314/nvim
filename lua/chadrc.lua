local pallete = {
  normal = {
    fg = "#c6c8d1",
    -- bg = "#171521",
    bg = "#191919", -- #1a1d1e
    border = "#313244",
    blue = "#89b4fa",
    red = "#ec6b64",
    black = "#1E1D2D",
  },
}

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "gruvchad",
  ---@type Base46HLGroupsList
  hl_add = {
    RenamerBorder = { fg = pallete.normal.red },
    RenamerTitle = { bg = pallete.normal.bg, fg = pallete.normal.red },
  },
  ---@type Base46HLGroupsList
  hl_override = {
    Normal = { bg = pallete.normal.bg, bold = false },
    FloatBorder = { fg = pallete.normal.border }, -- hover border

    TelescopePromptNormal = { fg = pallete.normal.fg, bg = "#1a1d1e" },
    TelescopePromptPrefix = { bg = "#1a1d1e" },
    TelescopePromptBorder = { fg = "#1a1d1e", bg = "#1a1d1e" },

    -- TelescopeBorder = { fg = pallete.normal.border, bg = pallete.normal.bg },
    -- TelescopeNormal = { bg = pallete.normal.bg },
    -- TelescopePromptNormal = { fg = pallete.normal.fg, bg = pallete.normal.bg },
    -- TelescopePromptPrefix = { bg = pallete.normal.bg },
    -- TelescopePromptBorder = { fg = pallete.normal.border, bg = pallete.normal.bg },

    NormalFloat = { bg = pallete.normal.bg },
    NvimTreeNormal = { bg = pallete.normal.bg },
    NvimTreeNormalNC = { bg = pallete.normal.bg },
    NvimTreeWinSeparator = { fg = pallete.normal.border, bg = pallete.normal.bg },
    Folded = { fg = pallete.normal.border, bg = pallete.normal.bg },
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
