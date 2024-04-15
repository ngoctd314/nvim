require "nvchad.mappings"

local map = vim.keymap.set

map("n", "P", "<cmd>b#<cr>", { desc = "Switch oldfiles" })

map("n", "<leader>q", function()
  vim.lsp.buf.code_action()
end, { desc = "Quick fix" })

map("n", "G", "Gzz", { desc = "Auto zz with G" })
-- ["*"] = { "*N", "Highlights" },

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

-- lsp
map("n", "<leader>rn", function()
  --require("nvchad.renamer").open()
  vim.lsp.buf.rename()
end, { desc = "LSP rename" })
map("n", "K", function()
  vim.diagnostic.open_float { border = "single" }
end, { desc = "Floating diagnostic" })

-- telescope
local telescope_builtin = require "telescope.builtin"
map("n", "<leader>f", function() end, { desc = "Telescope finds" })
map("n", "<leader>ff", function()
  telescope_builtin.find_files {
    follow = true,
    no_ignore = true,
    hidden = true,
    layout_strategy = "horizontal", -- horizontal, vertical
  }
end, { desc = "Find files" })
map("n", "<leader>fg", function()
  telescope_builtin.live_grep {
    follow = true,
    no_ignore = true,
    hidden = true,
    layout_strategy = "horizontal", -- horizontal, vertical
  }
end, { desc = "Live grep" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", { desc = "Oldfiles" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Current buffer fuzzy" })
map("n", "<leader>fs", function()
  telescope_builtin.lsp_document_symbols { symbol_width = 60, layout_strategy = "horizontal" }
end, { desc = "Telescope finds" })
map("n", "<leader>fm", function()
  telescope_builtin.marks { symbol_width = 60, layout_strategy = "horizontal" }
end, { desc = "Mark" })
map("n", "gd", function()
  telescope_builtin.lsp_definitions()
end, { desc = "lsp_definitions" })
map("n", "gi", function()
  telescope_builtin.lsp_implementations()
end, { desc = "lsp_implementations" })
map("n", "gr", function()
  telescope_builtin.lsp_references { fname_width = 60 }
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
