require("nvim-treesitter.configs").setup {
  sync_install = false,
  ignore_install = {},
  auto_install = false,
  modules = {},
  ensure_installed = {
    "lua",
    "go",
    "tsx",
    "javascript",
    "typescript",
    "python",
    "markdown",
    "yaml",
    "sql",
    "json",
    "html",
    "css",
  },

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner",
        ["ai"] = "@conditional.outer",
        ["ii"] = "@conditional.inner",
        ["aP"] = "@parameter.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_previous_start = {
        ["[f"] = "@function.outer",
        ["[c"] = "@class.outer",
      },
      goto_next_end = {
        ["]f"] = "@function.outer",
        ["]c"] = "@class.outer",
      },
    },
    swap = {
      enable = false,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },
  },
}
