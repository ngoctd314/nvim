local map = vim.keymap.set

map("n", "<leader>h", "<C-w>h")
map("n", "<leader>l", "<C-w>l")
map("n", "<leader>j", "<C-w>j")
map("n", "<leader>k", "<C-w>k")
map("n", "<leader>s", function() end, { desc = "Surrounding" })

-- yank
map("n", "<leader>yf", "yt{", { desc = "Yank function" })

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

-- telescope search
local telescope_builtin = require "telescope.builtin"
map("n", "<leader>f", function() end, { desc = "Telescope finds" })

map("n", "<leader>ff", function()
  telescope_builtin.find_files {
    file_ignore_patterns = { ".git" },
  }
end, { desc = "Find files" })
map("n", "<leader>fg", function()
  require("telescope").extensions.live_grep_args.live_grep_args {
    prompt_title = "Live grep",
    file_ignore_patterns = { ".git" },
    -- follow = true,
    -- no_ignore = true,
    -- hidden = true,
  }
end, { desc = "Live grep" })
map("n", "<leader>fo", function()
  telescope_builtin.oldfiles {
    only_cwd = true,
    mirror = false,
  }
end, { desc = "Oldfiles" })
map("n", "<leader>fb", function()
  telescope_builtin.buffers {}
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
  require("telescope").extensions.file_browser.file_browser {
    path = "%:p:h",
    select_buffer = true,
    initial_mode = "normal",
  }
end)
map("n", "<leader>ft", "<cmd>Telescope todo-comments todo<cr>", { desc = "Todo" })

-- telescope navigate
map("n", "gd", function()
  telescope_builtin.lsp_definitions {
    file_ignore_patterns = { "node_modules" },
  }
end, { desc = "lsp_definitions" })
map("n", "gi", function()
  telescope_builtin.lsp_implementations {
    file_ignore_patterns = { "node_modules" },
  }
end, { desc = "lsp_implementations" })
map("n", "gr", function()
  telescope_builtin.lsp_references {
    file_ignore_patterns = { "node_modules" },
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

-- refactor
map("n", "<leader>r", "", { desc = "refactor" })
map("n", "<leader>rr", function()
  require("grug-far").open()
  vim.cmd [[setlocal nospell]]
end, {
  desc = "Replace",
})
map("n", "<leader>rn", function()
  local currName = vim.fn.expand "<cword>" .. " "

  local win = require("plenary.popup").create(currName, {
    title = "lsp.rename",
    style = "minimal",
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    relative = "cursor",
    borderhighlight = "RenamerBorder",
    titlehighlight = "RenamerTitle",
    focusable = true,
    minwidth = 30,
    line = "cursor+2",
    col = "cursor-1",
  })

  vim.cmd "normal e"
  map({ "n" }, "<Esc>", "<cmd>q<CR>", { buffer = 0 })

  vim.keymap.set({ "i", "n" }, "<CR>", function()
    local newName = vim.trim(vim.fn.getline ".")
    vim.api.nvim_win_close(win, true)

    if #newName > 0 and newName ~= currName then
      local params = vim.lsp.util.make_position_params()
      params.newName = newName
      vim.lsp.buf_request(0, "textDocument/rename", params)
    end
    vim.cmd.stopinsert()
  end, { buffer = 0 })
end, { desc = "Rename" })

-- chat gpt
map("n", "<leader>c", function() end, { desc = "chatgpt, search" })
map("n", "<leader>cp", "<cmd>ChatGPT<cr>", { desc = "Open ChatGPT" })
map({ "n", "v" }, "<leader>cg", "<cmd>ChatGPTRun grammar_correction<cr>", { desc = "Grammar Correction" })

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
