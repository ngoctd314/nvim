local settings = {
  shiftwidth = 4,
  tabstop = 3,
  softtabstop = 3,
}

for k, v in pairs(settings) do
  vim.opt[k] = v
end
