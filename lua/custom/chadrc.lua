local hi = require "custom.highlights"

local M = {}

M.ui = {
  theme = "catppuccin",
  theme_toggle = { "catppuccin", "one_light" },
}

if M.ui.theme == "catppuccin" then
  M.ui.hl_override = hi.override
  M.ui.add = hi.add
end

-- M.plugins = "custom.plugins"

return M
