local map = vim.keymap.set

local function get_arguments()
  return coroutine.create(function(dap_run_co)
    local args = {}
    vim.ui.input({ prompt = "Args: " }, function(input)
      args = vim.split(input or "", " ")
      coroutine.resume(dap_run_co, args)
    end)
  end)
end

return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "leoluz/nvim-dap-go",
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap, dapui = require "dap", require "dapui"

      require("dapui").setup {
        controls = {
          element = "repl",
          enabled = true,
          icons = {
            disconnect = "",
            pause = "",
            play = "",
            run_last = "",
            step_back = "",
            step_into = "",
            step_out = "",
            step_over = "",
            terminate = "",
          },
        },
        element_mappings = {},
        expand_lines = true,
        floating = {
          border = "single",
          mappings = {
            close = { "q", "<Esc>" },
          },
        },
        force_buffers = true,
        icons = {
          collapsed = " ",
          current_frame = " ",
          expanded = " ",
        },
        layouts = {
          {
            elements = {
              {
                id = "scopes",
                size = 0.25,
              },
              {
                id = "breakpoints",
                size = 0.25,
              },
              {
                id = "stacks",
                size = 0.25,
              },
              {
                id = "watches",
                size = 0.25,
              },
            },
            position = "left",
            size = 40,
          },
          -- {
          --   elements = {
          --     {
          --       id = "repl",
          --       size = 0.5,
          --     },
          --     {
          --       id = "console",
          --       size = 0.5,
          --     },
          --   },
          --   position = "bottom",
          --   size = 10,
          -- },
        },
        mappings = {
          edit = "e",
          expand = { "<CR>", "<2-LeftMouse>" },
          open = "o",
          remove = "d",
          repl = "r",
          toggle = "t",
        },
        render = {
          indent = 1,
          max_value_lines = 100,
        },
      }
      require("dap-go").setup()

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
      dap.configurations.go = {
        -- works with go.mod packages and sub packages
        {
          type = "go",
          name = "Debug test (go.mod)",
          request = "launch",
          mode = "test",
          program = "./${relativeFileDirname}",
        },
        {
          type = "go",
          name = "Debug Package (Arguments)",
          request = "launch",
          program = "${fileDirname}",
          args = get_arguments,
          -- buildFlags = configs.delve.build_flags,
        },
      }

      map("n", "<leader>d", function() end, { desc = "Debugger" })
      map("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
      map("n", "<leader>dc", dap.continue, { desc = "Dap Continue" })
      map("n", "<leader>dj", dap.step_over, { desc = "Step over" })
      map("n", "<leader>di", dap.step_into, { desc = "Step into" })
      map("n", "<leader>do", dap.step_out, { desc = "Step out" })
      map("n", "<leader>dr", ":lua require('dapui').open({reset = true})<CR>", { desc = "Open DAP UI" })
      -- map("n", "<leader>df", function() end, { desc = "Float" })
      -- map("n", "<leader>dfs", function()
      --   dapui.float_element("scopes", { enter = true })
      -- end, { desc = "scopes" })
      -- map("n", "<leader>dfr", function()
      --   dapui.float_element("repl", { enter = true })
      -- end, { desc = "repl" })
      -- map("n", "<leader>dfw", function()
      --   dapui.float_element("watches", { enter = true })
      -- end, { desc = "watches" })

      vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#FF0000" })
      vim.api.nvim_set_hl(0, "DapLogPoint", { fg = "#61afef" })
      vim.api.nvim_set_hl(0, "DapStopped", { fg = "#98c379" })

      vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint" })
      vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DapBreakpoint" })
      vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DapBreakpoint" })
      vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DapLogPoint" })
      vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped" })
    end,
  },
}
