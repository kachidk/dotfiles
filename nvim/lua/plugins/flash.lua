return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    jump = {
      autojump = true,
    },
    label = {
      uppercase = false,
    },
  },
  -- stylua: ignore
  keys = {
    { "m", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "<S-m>", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
  },
}
