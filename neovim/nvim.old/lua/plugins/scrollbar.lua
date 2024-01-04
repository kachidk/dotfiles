return {
  "petertriho/nvim-scrollbar",
  dependencies = {
    "lewis6991/gitsigns.nvim",
    "kevinhwang91/nvim-hlslens",
  },
  config = function()
    require("scrollbar").setup({
      handlers = {
        cursor = true,
        diagnostic = true,
        gitsigns = true,
        search = true,
      },
      handle = {
        blend = 100,
      },
      marks = {
        GitAdd = {
          text = "│",
        },
        GitChange = {
          text = "│",
        },
        GitDelete = {
          text = "",
        },
      },
      excluded_filetypes = {
        "cmp_docs",
        "cmp_menu",
        "noice",
        "prompt",
        "TelescopePrompt",
        "alpha",
        "dashboard",
        "neo-tree",
        "DressingSelect",
        "DressingInput",
      },
    })

    require("scrollbar.handlers.gitsigns").setup()
    require("scrollbar.handlers.search").setup()
  end,
}
