return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-lua/plenary.nvim",
  },
  opts = function(_, opts)
    opts.defaults = {
      hidden = true,
      file_ignore_patterns = {
        ".git",
      },
    }

    local fb_actions = require("telescope").extensions.file_browser.actions

    opts.extensions = {
      file_browser = {
        display_stat = false,
        mappings = {
          i = {
            ["<C-a>"] = fb_actions.create,
            ["<C-d>"] = fb_actions.remove,
            ["<C-r>"] = fb_actions.rename,
            ["<C-y>"] = fb_actions.copy,
            ["<C-x>"] = fb_actions.move,
            ["<A-c>"] = false,
            ["<A-d>"] = false,
            ["<A-r>"] = false,
            ["<A-y>"] = false,
            ["<A-m>"] = false,
          },
          n = {
            ["a"] = fb_actions.create,
            ["x"] = fb_actions.move,
            ["c"] = false,
            ["m"] = false,
          },
        },
      },
    }
  end,
  config = function(_, opts)
    local telescope = require("telescope")

    telescope.setup(opts)

    telescope.load_extension("file_browser")
  end,
}
