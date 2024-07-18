return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    opts.window.position = "right"

    opts.window.width = "30"

    opts.filesystem.filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
      never_show = { ".git" },
    }
  end,
}
