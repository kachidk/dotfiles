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
  keys = {
    {
      "s",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump({
          search = { forward = true, wrap = false, multi_window = false },
        })
      end,
      desc = "Flash forward jump",
    },
    {
      "<s-s>",
      mode = { "n", "o", "x" },
      function()
        require("flash").jump({
          search = { forward = false, wrap = false, multi_window = false },
        })
      end,
      desc = "Flash backword jump",
    },
  },
}
