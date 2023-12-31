-- n, v, i, t = mode names

local M = {}

M.general = {
    i = {
        -- navigate within insert mode
        -- ["<C-h>"] = { "<Left>", "Move left" },
        -- ["<C-l>"] = { "<Right>", "Move right" },
        -- ["<C-j>"] = { "<Down>", "Move down" },
        -- ["<C-k>"] = { "<Up>", "Move up" },
    },

    n = {
        -- ["<Esc>"] = { ":noh <CR>", "Clear highlights" },
        -- switch between windows
        ["<C-h>"] = { "<C-w>h", "Window left" },
        ["<C-l>"] = { "<C-w>l", "Window right" },
        ["<C-j>"] = { "<C-w>j", "Window down" },
        ["<C-k>"] = { "<C-w>k", "Window up" },
        ["<leader>q"] = {
            function()
                vim.lsp.buf.code_action()
            end,
            "Quick fix",
        },
        ["*"] = { "*N", "Highlights" },

        -- setting
        ["<leader>s"] = { function() end, "Set" },
        ["<leader>sn"] = { "<cmd>set nu! rnu!<cr>", "Toggle number" },
        ["P"] = { "<cmd>b#<cr>", "Switch oldfiles" },
        ["U"] = { "<C-r>", "Redodo" },
        ["G"] = { "Gzz" }, -- auto zz with G

        -- copy
        -- ["<leader>c"] = { function() end, "+Copy" },
        -- ["<leader>c$"] = {
        --   function()
        --     vim.cmd.normal "v$hy"
        --   end,
        --   "End of line",
        -- },

        -- ["<leader>sc"] = {
        --   function()
        -- local clipboard = vim.cmd "echo @+"
        -- vim.cmd.echo(tostring(clipboard))
        --   end,
        --   "Show clipboard",
        -- },

        -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
        -- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
        -- empty mode is same as using <cmd> :map
        -- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
        -- ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
        -- ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
        -- ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
        -- ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
    },

    -- t = {
    --   ["<C-x>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" },
    -- },

    v = {
        ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
        ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
    },

    x = {
        ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
        ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
        -- Don't copy the replaced text after pasting in visual mode
        -- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
        ["p"] = { 'p:let @+=@0<CR>:let @"=@0<CR>', "Dont copy replaced text", opts = { silent = true } },
    },
}

M.tabufline = {
    plugin = true,

    n = {
        -- cycle through buffers
        ["L"] = {
            function()
                require("nvchad.tabufline").tabuflineNext()
            end,
            "Goto next buffer",
        },

        ["H"] = {
            function()
                require("nvchad.tabufline").tabuflinePrev()
            end,
            "Goto prev buffer",
        },

        -- close buffer + hide terminal buffer
        ["<leader>x"] = {
            function()
                require("nvchad.tabufline").close_buffer()
            end,
            "Close buffer",
        },
    },
}

M.comment = {
    plugin = true,

    -- toggle comment in both modes
    n = {
        ["<C-_>"] = {
            function()
                require("Comment.api").toggle.linewise.current()
            end,
            "Toggle comment",
        },
    },
    i = {
        ["<C-_>"] = {
            function()
                require("Comment.api").toggle.linewise.current()
            end,
            "Toggle comment",
        },
    },

    v = {
        ["<C-_>"] = {
            "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
            "Toggle comment",
        },
    },
}

M.lspconfig = {
    plugin = true,
    -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

    n = {
        ["<leader>rn"] = {
            function()
                require("nvchad.renamer").open()
                vim.lsp.buf.rename()
            end,
            "LSP rename",
        },

        ["K"] = {
            function()
                vim.diagnostic.open_float { border = "single" }
            end,
            "Floating diagnostic",
        },

        -- ["<leader>wa"] = {
        --   function()
        --     vim.lsp.buf.add_workspace_folder()
        --   end,
        --   "Add workspace folder",
        -- },

        -- ["<leader>wr"] = {
        --   function()
        --     vim.lsp.buf.remove_workspace_folder()
        --   end,
        --   "Remove workspace folder",
        -- },

        -- ["<leader>wl"] = {
        --   function()
        --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        --   end,
        --   "List workspace folders",
        -- },
    },
}

M.nvimtree = {
    plugin = true,
    n = {
        ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
    },
}

M.telescope = {
    plugin = true,

    n = {
        -- find
        ["<leader>f"] = { function() end, "Telescope finds" },
        ["<leader>ff"] = {
            function()
                vim.cmd.normal "mP"
                require("telescope.builtin").find_files {
                    follow = true,
                    no_ignore = true,
                    hidden = true,
                    layout_strategy = "horizontal", -- horizontal, vertical
                }
            end,
            "Find all files",
        },
        ["<leader>fg"] = {
            function()
                vim.cmd.normal "mP"
                require("telescope.builtin").live_grep {
                    follow = true,
                    no_ignore = true,
                    hidden = true,
                    layout_strategy = "horizontal", -- horizontal, vertical
                }
            end,
            "Live grep",
        },
        ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
        ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
        ["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },
        ["<leader>ft"] = {
            function()
                vim.cmd.normal "mP"
                require("telescope.builtin").lsp_document_symbols { symbol_width = 60, layout_strategy = "horizontal" }
            end,
            "Lists document symbols",
        },
        ["<leader>fm"] = {
            function()
                vim.cmd.normal "mP"
                require("telescope.builtin").marks { symbol_width = 60, layout_strategy = "horizontal" }
            end,
            "Lists all marks",
        },
    },
}

M.whichkey = {
    plugin = true,

    n = {
        -- ["<leader>wK"] = {
        --   function()
        --     vim.cmd "WhichKey"
        --   end,
        --   "Which-key all keymaps",
        -- },
        -- ["<leader>wk"] = {
        --   function()
        --     local input = vim.fn.input "WhichKey: "
        --     vim.cmd("WhichKey " .. input)
        --   end,
        --   "Which-key query lookup",
        -- },
        ["gd"] = {
            function()
                vim.cmd.normal "ma"
                require("telescope.builtin").lsp_definitions()
            end,
            "Jumps to the definition",
        },
        ["gi"] = {
            function()
                vim.cmd.normal "ma"
                require("telescope.builtin").lsp_implementations()
            end,
            "Jumps to the implementations",
        },
        ["gr"] = {
            function()
                vim.cmd.normal "ma"
                require("telescope.builtin").lsp_references { fname_width = 60 }
            end,
            "List references",
        },
        ["ge"] = {
            function()
                vim.cmd "TroubleToggle"
            end,
            "Trouble toggle",
        },
        ["<leader>h"] = {
            function()
                vim.cmd "nohl"
            end,
            "No highlight",
        },
        ["[d"] = {
            function()
                vim.cmd.normal "ma"
                vim.diagnostic.goto_prev { float = { border = "single" } }
            end,
            "Goto prev",
        },

        ["]d"] = {
            function()
                vim.cmd.normal "ma"
                vim.diagnostic.goto_next { float = { border = "single" } }
            end,
            "Goto next",
        },
    },
}

M.blankline = {
    plugin = true,

    n = {
        ["<leader>cc"] = {
            function()
                local ok, start = require("indent_blankline.utils").get_current_context(
                    vim.g.indent_blankline_context_patterns,
                    vim.g.indent_blankline_use_treesitter_scope
                )

                if ok then
                    vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start, 0 })
                    vim.cmd [[normal! _]]
                end
            end,

            "Jump to current context",
        },
    },
}

M.gitsigns = {
    plugin = true,

    n = {
        -- Navigation through hunks
        ["]c"] = {
            function()
                if vim.wo.diff then
                    return "]c"
                end
                vim.schedule(function()
                    require("gitsigns").next_hunk()
                end)
                return "<Ignore>"
            end,
            "Jump to next hunk",
            opts = { expr = true },
        },

        ["[c"] = {
            function()
                if vim.wo.diff then
                    return "[c"
                end
                vim.schedule(function()
                    require("gitsigns").prev_hunk()
                end)
                return "<Ignore>"
            end,
            "Jump to prev hunk",
            opts = { expr = true },
        },

        -- Actions
        ["<leader>rh"] = {
            function()
                require("gitsigns").reset_hunk()
            end,
            "Reset hunk",
        },

        ["<leader>ph"] = {
            function()
                require("gitsigns").preview_hunk()
            end,
            "Preview hunk",
        },

        ["<leader>td"] = {
            function()
                require("gitsigns").toggle_deleted()
            end,
            "Toggle deleted",
        },
    },
}

return M
