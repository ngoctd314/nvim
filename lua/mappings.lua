require "nvchad.mappings"

local map = vim.keymap.set

map("n", "U", "<cmd>redo<cr>", { desc = "Redo" })

map("n", "P", "<cmd>b#<cr>", { desc = "Switch oldfiles" })
map("n", "<leader>h", "<cmd>nohl<cr>", { desc = "nohl" })

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
    layout_strategy = "vertical", -- horizontal, vertical
    layout_config = {
      vertical = {
        prompt_position = "top",
        mirror = true,
        preview_cutoff = 120,
      },
      width = 80,
      height = 50,
    },
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
map("n", "<leader>fo", function()
  telescope_builtin.oldfiles {
    only_cwd = true,
    mirror = false,
    layout_strategy = "vertical",
    layout_config = {
      vertical = {
        prompt_position = "top",
        mirror = true,
        preview_cutoff = 120,
      },
      width = 80,
      height = 50,
    },
  }
end, { desc = "Oldfiles" })
map("n", "<leader>fb", function()
  telescope_builtin.buffers {
    follow = true,
    no_ignore = true,
    hidden = true,
    layout_strategy = "vertical", -- horizontal, vertical
    layout_config = {
      vertical = {
        prompt_position = "top",
        mirror = true,
        preview_cutoff = 120,
      },
      width = 80,
      height = 50,
    },
  }
end, { desc = "Buffers" })
map("n", "<leader>fz", function()
  telescope_builtin.current_buffer_fuzzy_find {
    layout_strategy = "vertical", -- horizontal, vertical
    layout_config = {
      vertical = {
        prompt_position = "top",
        mirror = true,
        preview_cutoff = 120,
      },
    },
  }
end, { desc = "Current buffer fuzzy" })

map("n", "<leader>fs", function()
  -- telescope_builtin.lsp_document_symbols { symbol_width = 60, layout_strategy = "horizontal" }
  require("telescope").extensions.aerial.aerial {
    symbol_width = 60,
    layout_strategy = "horizontal",
  }
end, { desc = "Symbols" })
map("n", "<leader>fd", function()
  telescope_builtin.diagnostics()
end, { desc = "diagnostics" })
-- map("n", "<leader>fm", "<cmd>Telescope feat-marks todo<cr>", { desc = "Feat marks" })
-- map("n", "<leader>fm", function()
--   telescope_builtin.marks { symbol_width = 60, layout_strategy = "horizontal" }
-- end, { desc = "Mark" })
map("n", "<leader>ft", "<cmd>Telescope todo-comments todo<cr>", { desc = "Todo" })

-- telescope navigate
map("n", "gd", function()
  telescope_builtin.lsp_definitions { layout_strategy = "horizontal" }
end, { desc = "lsp_definitions" })
map("n", "gi", function()
  telescope_builtin.lsp_implementations {
    layout_strategy = "horizontal",
  }
end, { desc = "lsp_implementations" })
map("n", "gr", function()
  telescope_builtin.lsp_references {
    layout_strategy = "horizontal",
  }
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

-- re
map("n", "<leader>r", function() end, { desc = "re" })

-- chat gpt
map("n", "<leader>c", function() end, { desc = "chatgpt, current context" })
map("n", "<leader>cp", "<cmd>ChatGPT<cr>", { desc = "Open ChatGPT" })
map("v", "<leader>ci", "<cmd>ChatGPTEditWithInstructions<cr>", { desc = "Open ChatGPT edit with instruction" })
