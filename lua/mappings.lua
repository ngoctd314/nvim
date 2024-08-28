local map = vim.keymap.set

-- map("i", "<C-h>", "<Left>", { desc = "move left" })
-- map("i", "<C-l>", "<Right>", { desc = "move right" })
-- map("i", "<C-j>", "<Down>", { desc = "move down" })
-- map("i", "<C-k>", "<Up>", { desc = "move up" })
map("n", "<leader>h", "<C-w>h")
map("n", "<leader>l", "<C-w>l")
map("n", "<leader>j", "<C-w>j")
map("n", "<leader>k", "<C-w>k")

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

map("n", "<leader>cc", function()
  local config = { scope = {} }
  config.scope.exclude = { language = {}, node_type = {} }
  config.scope.include = { node_type = {} }
  local node = require("ibl.scope").get(vim.api.nvim_get_current_buf(), config)

  if node then
    local start_row, _, end_row, _ = node:range()
    if start_row ~= end_row then
      vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start_row + 1, 0 })
      vim.api.nvim_feedkeys("_", "n", true)
    end
  end
end, { desc = "blankline jump to current context" })

map("n", "U", "<cmd>redo<cr>", { desc = "Redo" })

map("n", "P", "<cmd>b#<cr>", { desc = "Switch oldfiles" })

map("n", "<leader>q", function()
  vim.lsp.buf.code_action()
end, { desc = "Quick fix" })

map("n", "G", "Gzz", { desc = "Auto zz with G" })
map("n", "*", "*N", { desc = "Highlights" })

map("n", "L", "<cmd>bnext<cr>", { desc = "Buffer next" })
map("n", "H", "<cmd>bprevious<cr>", { desc = "Buffer previous" })
map("n", "<leader>x", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "Close buffer" })

-- toggle comment in both modes
map({ "n", "i" }, "<C-_>", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "Toggle comment" })
map(
  "v",
  "<C-_>",
  "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
  { desc = "Toggle comment" }
)

-- telescope search
local telescope_builtin = require "telescope.builtin"
map("n", "<leader>f", function() end, { desc = "Telescope finds" })

map("n", "<leader>ff", function()
  telescope_builtin.find_files {
    follow = true,
    no_ignore = true,
    hidden = true,
  }
end, { desc = "Find files" })
map("n", "<leader>fg", function()
  require("telescope").extensions.live_grep_args.live_grep_args {
    prompt_title = "Live grep",
    follow = true,
    no_ignore = true,
    hidden = true,
  }
end, { desc = "Live grep" })

map("n", "<leader>fo", function()
  telescope_builtin.oldfiles {
    only_cwd = true,
    mirror = false,
  }
end, { desc = "Oldfiles" })
map("n", "<leader>fb", function()
  telescope_builtin.buffers {
    follow = true,
    no_ignore = true,
    hidden = true,
  }
end, { desc = "Buffers" })
map("n", "<leader>fz", function()
  telescope_builtin.current_buffer_fuzzy_find {}
end, { desc = "Current buffer fuzzy" })

map("n", "<leader>fs", function()
  require("telescope").extensions.aerial.aerial {
    layout_strategy = "vertical",
    layout_config = {
      width = 100,
      height = 25,
    },
  }
end, { desc = "Symbols" })
map("n", "<leader>fd", function()
  telescope_builtin.diagnostics {
    sort_by = "severity",
  }
end, { desc = "diagnostics" })
map("n", "<leader>fe", function()
  require("telescope").extensions.file_browser.file_browser()
end)
map("n", "<leader>ft", "<cmd>Telescope todo-comments todo<cr>", { desc = "Todo" })

-- map("n", "gd", vim.lsp.buf.definition, { desc = "go to definition" })
-- map("n", "gi", vim.lsp.buf.implementation, { desc = "go to implementation" })
-- map("n", "gr", vim.lsp.buf.references, { desc = "show references" })

-- telescope navigate
map("n", "gd", function()
  telescope_builtin.lsp_definitions {}
end, { desc = "lsp_definitions" })
map("n", "gi", function()
  telescope_builtin.lsp_implementations {}
end, { desc = "lsp_implementations" })
map("n", "gr", function()
  telescope_builtin.lsp_references {}
end, { desc = "lsp_references" })

-- diagnostic
map("n", "[d", function()
  vim.diagnostic.goto_prev { float = { border = "single" } }
end, { desc = "diagnostic.goto_prev" })
map("n", "]d", function()
  vim.diagnostic.goto_next { float = { border = "single" } }
end, { desc = "diagnostic.goto_next" })

-- nvimtree
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle nvimtree" })

-- git
map("n", "<leader>g", function() end, { desc = "Git" })
map("n", "<leader>gb", "<cmd>Gitsigns blame_line<cr>", { desc = "Gitsigns blame_line" })
map("n", "<leader>gs", "<cmd>Gitsigns toggle_signs<cr>", { desc = "Gitsigns toggle_signs" })

-- re
map("n", "<leader>r", function() end, { desc = "re" })
map("n", "<leader>rn", function()
  -- vim.lsp.buf.rename()
  require "util.renamer"()
end, { desc = "rename" })

-- chat gpt
map("n", "<leader>c", function() end, { desc = "chatgpt, search" })
map("n", "<leader>cp", "<cmd>ChatGPT<cr>", { desc = "Open ChatGPT" })
map({ "n", "v" }, "<leader>ct", "<cmd>ChatGPTRun translate<cr>", { desc = "Translate" })
map({ "n", "v" }, "<leader>cg", "<cmd>ChatGPTRun grammar_correction<cr>", { desc = "Grammar Correction" })
map("v", "<leader>ci", "<cmd>ChatGPTEditWithInstructions<cr>", { desc = "Open ChatGPT edit with instruction" })

map("n", "<leader>m", function() end, { desc = "marks" })
map("n", "<leader>ml", "<cmd>BookmarksListAll<cr>", { desc = "MarksListAll" })

local marks = require "marks"
map("n", "<leader>ms", function()
  marks.set_bookmark0()
end, { desc = "set_bookmark0" })
map("n", "<leader>md", function()
  marks.delete_bookmark()
end, { desc = "delete_bookmark" })
map("n", "<leader>mD", function()
  marks.delete_buf()
end, { desc = "delete_buf" })

-- tabs
map({ "n" }, "<C-n>", "<cmd>tabnext<cr>i", { desc = "tabnext" })
map({ "i" }, "<C-n>", "<C-o>:tabnext<CR>", { noremap = true, silent = true })
map({ "t" }, "<C-n>", "<C-\\><C-n>:tabnext<CR>", { noremap = true, silent = true })
