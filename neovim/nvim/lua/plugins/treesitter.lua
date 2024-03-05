return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "BufReadPost",
  dependencies = {
    { "windwp/nvim-autopairs", opts = {} },
    { "windwp/nvim-ts-autotag", opts = {} },
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      highlight = { enable = true },
      autopairs = { enable = true },
      autotag = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<c-space>",
          node_incremental = "<c-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "markdown",
        "markdown_inline",
        "vue",
        "javascript",
        "typescript",
        "tsx",
        "html",
        "css",
        "scss",
        "json",
        "php",
        "prisma",
      },
    })
  end,
}
