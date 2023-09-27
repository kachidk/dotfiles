return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "williamboman/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",
    "ravenxrz/DAPInstall.nvim",
  },
  config = function()
    require("mason-nvim-dap").setup({
      automatic_setup = true,
      ensure_installed = {},
    })

    require("dap-install").setup({})

    -- stylua: ignore start
    vim.keymap.set("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", { desc = "Toggle Breakpoint" })
    vim.keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", { desc = "Start/Continue" })
    vim.keymap.set("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", { desc = "Step Into" })
    vim.keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", { desc = "Step Over" })
    vim.keymap.set("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", { desc = "Step Out" })
    vim.keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", { desc = "Toggle REPL" })
    vim.keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", { desc = "Run Last" })
    vim.keymap.set("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", { desc = "Toggle DAP UI" })
    vim.keymap.set("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", { desc = "Terminate" })
    -- stylua: ignore end

    local dap = require("dap")
    local dapui = require("dapui")

    dapui.setup({
      icons = { expanded = "", collapsed = "", circular = "" },
    })

    dap.listeners.after.event_initialized["dapui_config"] = dapui.open
    dap.listeners.before.event_terminated["dapui_config"] = dapui.close
    dap.listeners.before.event_exited["dapui_config"] = dapui.close
  end,
}
