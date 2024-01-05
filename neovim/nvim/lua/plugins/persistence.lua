return {
  "folke/persistence.nvim",
  event = "BufReadPre",
  opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp" } },
  -- stylua: ignore
  keys = {
    { "<leader>Ss", function() require("persistence").load() end, desc = "Restore Session (CWD)" },
    { "<leader>Sl", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
    { "<leader>Sr", function() require("persistence").start() end, desc = "Start recording current session" },
    { "<leader>SR", function() require("persistence").stop() end, desc = "Stop recording current session" },
  },
}
