local map = vim.keymap.set

map({ "n", "t" }, "<C-t>", "<cmd>ToggleTerm direction=float<cr>", { desc = "Terminal Toggle Floating term" })

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  map("t", "<esc>", [[<C-\><C-n>]], opts)
  -- map("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  -- map("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  -- map("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
  -- map("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  -- map("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end
vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"

return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    lazy = false,
    config = function()
      require("toggleterm").setup {
        open_mapping = [[<c-\>]],
        size = function(term)
          if term.direction == "horizontal" then
            return 18
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
          end
        end,
        highlights = {
          Normal = {
            guibg = "#191919",
          },
          NormalFloat = {},
          FloatBorder = {
            guifg = "#313244",
          },
        },
        shade_terminals = false,
        direction = "float", --'vertical' | 'horizontal' | 'tab' | 'float',
        float_opts = {
          border = "single",
          width = 160,
          height = 30,
          -- row = 10,
          -- col = 10,
          -- winblend = 10,
          zindex = 1000,
          title_pos = "center",
        },
      }
    end,
  },
}
