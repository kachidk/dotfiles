return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local which_key = require("which-key")

    which_key.setup({})

    which_key.register({
      mode = { "n", "v" },
      ["<leader>b"] = { name = "Buffers" },
      ["<leader>d"] = { name = "Debug" },
      ["<leader>f"] = { name = "Find (Telescope)" },
      ["<leader>t"] = { name = "Tabs" },
      ["<leader>w"] = { name = "Windows" },
      ["<leader>x"] = { name = "Diagnostics/Quickfix" },
      ["<leader>p"] = { name = "Tools" },
      ["<leader>c"] = { name = "Code" },
      ["<leader>ct"] = { name = "Tools" },
      ["<leader>g"] = { name = "Git" },
      ["<leader>gh"] = { name = "Hunk" },
      ["<leader>gd"] = { name = "Diff" },
      ["<leader>u"] = { name = "UI/UX" },
      ["<leader>s"] = { name = "Search" },
      ["<leader>sn"] = { name = "Noice" },
      ["<leader>S"] = { name = "Session" },
    })
  end,
}
