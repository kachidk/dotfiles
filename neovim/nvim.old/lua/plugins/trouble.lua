return {
  "folke/trouble.nvim",
  cmd = { "TroubleToggle", "Trouble" },
  opts = { use_diagnostic_signs = true },
  keys = {
    { "<leader>ix", "<cmd>TroubleToggle document_diagnostics<cr>",  desc = "Document diagnostics (Trouble)" },
    { "<leader>iX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace diagnostics (Trouble)" },
    { "<leader>iL", "<cmd>TroubleToggle loclist<cr>",               desc = "Location list (Trouble)" },
    { "<leader>iQ", "<cmd>TroubleToggle quickfix<cr>",              desc = "Quickfix list (Trouble)" },
  },
}
