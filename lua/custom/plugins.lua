local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "custom.configs.easymotion"
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lsp-config
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = false,
    config = function()
      require "custom.configs.treesitter-textobject"
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
  {
    "phaazon/hop.nvim", -- easymotion
    lazy = false,
    config = function()
      require "custom.configs.easymotion"
    end,
  },
  {
    "github/copilot.vim",
    lazy = true,
  },
  {
    "kylechui/nvim-surround", -- change pairs
    lazy = false,
    config = function()
      require("nvim-surround").setup()
    end,
  },
  {
    "nvim-telescope/telescope-media-files.nvim",
    lazy = false,
    config = function()
      require "custom.configs.telescope_ext"
    end,
  },
  {
    "olexsmir/gopher.nvim",
    lazy = false,
    ft = "go",
    config = function()
      require "custom.configs.gopher"
    end,
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    config = function()
      require "custom.configs.trouble"
    end,
  },
  {
    "RRethy/vim-illuminate",
    lazy = true,
    config = function()
      require "custom.configs.illuminate"
    end,
  },

  -- Install a plugin
  -- {      require "custom.configs.easy-motion"
  --   "max397574/better-escape.nvim",
  --   event = "InsertEnter",
  --   config = function()
  --     require("better_escape").setup()
  --   end,
  -- },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
