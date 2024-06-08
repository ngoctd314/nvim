require "nvchad.mappings"

local map = vim.keymap.set

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
    -- prompt_title = "",
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
      width = 120,
      height = 50,
    },
  }
end, { desc = "Find files" })
map("n", "<leader>fg", function()
  telescope_builtin.live_grep {
    -- prompt_title = "",
    -- preview_title = "",
    follow = true,
    no_ignore = true,
    hidden = true,
    layout_strategy = "horizontal", -- horizontal, vertical
  }
end, { desc = "Live grep" })
map("n", "<leader>fo", function()
  telescope_builtin.oldfiles {
    -- prompt_title = "Live grep",
    only_cwd = true,
    mirror = false,
    layout_strategy = "vertical",
    layout_config = {
      vertical = {
        prompt_position = "top",
        mirror = true,
        preview_cutoff = 120,
      },
      width = 120,
      height = 50,
    },
    -- on_complete = {
    --   function()
    --     vim.cmd "stopinsert"
    --   end,
    -- },
  }
end, { desc = "Oldfiles" })
map("n", "<leader>fb", function()
  telescope_builtin.buffers {
    -- prompt_title = "",
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
      width = 120,
      height = 50,
    },
  }
end, { desc = "Buffers" })
map("n", "<leader>fz", function()
  telescope_builtin.current_buffer_fuzzy_find {
    -- prompt_title = "",
    layout_strategy = "vertical", -- horizontal, vertical
    layout_config = {
      vertical = {
        prompt_position = "top",
        mirror = true,
        preview_cutoff = 120,
      },
      width = 120,
      height = 50,
    },
  }
end, { desc = "Current buffer fuzzy" })

map("n", "<leader>fs", function()
  -- telescope_builtin.lsp_document_symbols { symbol_width = 60, layout_strategy = "horizontal" }
  require("telescope").extensions.aerial.aerial {
    -- prompt_title = "",
    symbol_width = 60,
    layout_strategy = "horizontal",
  }
end, { desc = "Symbols" })
map("n", "<leader>fd", function()
  telescope_builtin.diagnostics {
    sort_by = "severity",
  }
end, { desc = "diagnostics" })
-- map("n", "<leader>fm", "<cmd>Telescope feat-marks todo<cr>", { desc = "Feat marks" })
-- map("n", "<leader>fm", function()
--   telescope_builtin.marks { symbol_width = 60, layout_strategy = "horizontal" }
-- end, { desc = "Mark" })
map("n", "<leader>ft", "<cmd>Telescope todo-comments todo<cr>", { desc = "Todo" })
-- harpoon
map("n", "<leader>fh", function()
  local harpoon = require "harpoon"
  local conf = require("telescope.config").values
  local file_paths = {}
  for _, item in ipairs(harpoon:list().items) do
    table.insert(file_paths, item.value)
  end

  require("telescope.pickers")
    .new({}, {
      prompt_title = "Harpoon",
      finder = require("telescope.finders").new_table {
        results = file_paths,
      },
      layout_strategy = "vertical", -- horizontal, vertical
      layout_config = {
        vertical = {
          prompt_position = "top",
          mirror = true,
          preview_cutoff = 120,
        },
        width = 120,
        height = 50,
      },
      sorter = conf.generic_sorter {},
    })
    :find()
  -- end
end, { desc = "Open harpoon window" })

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
map("n", "<leader>gs", "<cmd>Gitsigns toggle_signs<cr>", { desc = "Gitsigns toggle_signs" })

-- re
map("n", "<leader>r", function() end, { desc = "re" })

-- chat gpt
map("n", "<leader>s", function() end, { desc = "chatgpt, search" })
map("n", "<leader>sp", "<cmd>ChatGPT<cr>", { desc = "Open ChatGPT" })
map("v", "<leader>si", "<cmd>ChatGPTEditWithInstructions<cr>", { desc = "Open ChatGPT edit with instruction" })

-- tmux
map("n", "<c-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "TmuxNavigateLeft" })
map("n", "<c-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "TmuxNavigateDown" })
map("n", "<c-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "TmuxNavigateUp" })
--   { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },

map("n", "]a", "`a", { desc = "go to mark a" })

--
-- map("n", "]}", "<cmd>call search('}')<cr>", { desc = "go to first }" })
--
