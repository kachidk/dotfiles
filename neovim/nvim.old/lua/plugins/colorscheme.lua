return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      integrations = {
        alpha = true,
        cmp = true,
        flash = true,
        gitsigns = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        lsp_trouble = true,
        mason = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        noice = true,
        notify = true,
        neotree = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        which_key = true,
      },
    },
  },
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
    opts = {
      options = {
        cursorline = true,
      },
    },
  },
  {
    "AstroNvim/astrotheme",
    priority = 1000,
    opts = {},
  },
  { "gbprod/nord.nvim", priority = 1000 },
}
