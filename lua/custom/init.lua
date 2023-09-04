local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--
-- vim.cmd [[
--   au BufWinLeave * silent mkview
--   au BufWinEnter * silent loadview
-- ]]

autocmd("BufWinLeave", {
  pattern = "*",
  command = "silent! mkview",
})

autocmd("BufWinEnter", {
  pattern = "*",
  command = "silent! loadview",
})
