return {
  "lukas-reineke/indent-blankline.nvim",
  event = "BufReadPre",
  opts = {
    use_treesitter = true,
    show_current_context = true,
    filetype_exclude = {
      "help",
      "alpha",
      "dashboard",
      "Trouble",
      "lazy",
      "mason",
      "notify",
      "toggleterm",
      "lazyterm",
    },
  },
}
