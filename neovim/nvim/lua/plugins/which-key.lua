return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local which_key = require("which-key")

    which_key.setup({})

    which_key.register({
      mode = { "n", "v" },
      ["g"] = { name = "Goto" },
      ["gs"] = { name = "Surround" },
      ["]"] = { name = "Next" },
      ["["] = { name = "Prev" },
      ["<leader>b"] = { name = "Buffers" },
      ["<leader>d"] = { name = "Debug" },
      ["<leader>f"] = { name = "Find (Telescope)" },
      ["<leader>i"] = { name = "Diagnostics/Quickfix" },
      ["<leader>p"] = { name = "Tools" },
      ["<leader>l"] = { name = "LSP" },
      ["<leader>g"] = { name = "Git" },
      ["<leader>u"] = { name = "UI/UX" },
      ["<leader>s"] = { name = "Search" },
      ["<leader>S"] = { name = "Session" },
    })
  end,
}
