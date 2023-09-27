return {
  "petertriho/nvim-scrollbar",
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
  end,
}
