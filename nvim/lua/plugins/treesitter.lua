return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "BufReadPost",
  dependencies = {
    { "windwp/nvim-autopairs", opts = {} },
    { "windwp/nvim-ts-autotag", opts = {} },
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      highlight = { enable = true },
      autopairs = { enable = true },
      autotag = { enable = true },
      indent = { enable = true },
      context_commentstring = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gn",
          node_incremental = "gn",
          scope_incremental = false,
          node_decremental = "gm",
        },
      },
      ensure_installed = {
        "lua",
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
      },
    })
  end,
}
