return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    opts.defaults = {
      hidden = true,
      file_ignore_patterns = {
        "%.git/",
      },
    }
  end,
  config = function(_, opts)
    local telescope = require("telescope")

    telescope.setup(opts)
  end,
}
