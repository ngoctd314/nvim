return {
  {
    "MagicDuck/grug-far.nvim",
    config = function()
      require("grug-far").setup {
        keymaps = {
          syncLine = { n = "<localleader>l" },
          refresh = { n = "<localleader>f" },
          openLocation = { n = "<localleader>o" },
          openNextLocation = { n = "<down>" },
          openPrevLocation = { n = "<up>" },
          gotoLocation = { n = "<enter>" },
          pickHistoryEntry = { n = "<enter>" },
          help = { n = "g?" },
          toggleShowCommand = { n = "<localleader>p" },
          close = { n = "<localleader>c" },
          qflist = { n = "<localleader>q" },
          abort = { n = "<localleader>b" },
          previewLocation = { n = "<localleader>i" },

          historyOpen = { n = "<localleader>T" },
          historyAdd = { n = "<localleader>A" },
          syncLocations = { n = "<localleader>S" },
          replace = { n = "<localleader>R" },
          swapEngine = { n = "<localleader>E" },
        },
      }
    end,
  },
}