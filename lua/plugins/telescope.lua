local actions = require "telescope.actions"

local options = {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "-L",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    prompt_prefix = "   ",
    selection_caret = "  ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    -- prompt_title = "",
    results_title = "",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.5,
        preview_cutoff = 140,
      },
      vertical = {
        prompt_position = "top",
        mirror = true,
        preview_cutoff = 120,
        -- preview_width = 0.55,
      },
      width = function(_, max_columns)
        local percentage = 1
        local max = 180
        return math.min(math.floor(percentage * max_columns), max)
      end,
      height = function(_, _, max_lines)
        local percentage = 1
        local max = 40
        return math.min(math.floor(percentage * max_lines), max)
      end,
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = { "node_modules", ".git" },
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { "truncate" },
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    mappings = {
      n = { ["q"] = require("telescope.actions").close },
      i = {
        ["<C-j>"] = actions.cycle_history_next,
        ["<C-k>"] = actions.cycle_history_prev,
      },
    },
  },

  extensions_list = { "themes", "aerial", "fzf", "media_files" },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = { "png", "webp", "jpg", "jpeg" },
      -- find command (defaults to `fd`)
      find_cmd = "fd",
    },
  },
}

return {
  "nvim-telescope/telescope.nvim",
  lazy = true,
  dependencies = {
    "stevearc/aerial.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-lua/popup.nvim", "nvim-telescope/telescope-media-files.nvim" },
  },
  cmd = "Telescope",
  config = function()
    dofile(vim.g.base46_cache .. "telescope")
    local telescope = require "telescope"
    telescope.setup(options)

    require("aerial").setup {
      icons = {
        Method = "󰆧",
        Function = "󰆧",
      },
    }
    -- load extensions
    for _, ext in ipairs(options.extensions_list) do
      telescope.load_extension(ext)
    end
  end,
}
