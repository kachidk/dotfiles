return {
  {
    "gbprod/cutlass.nvim",
    opts = { cut_key = "x" },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      opts.window.position = "right"

      opts.filesystem.filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
        never_show = { ".git" },
      }

      return opts
    end,
  },
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      opts.section.header.val = {
        "███╗   ██╗███████╗██╗  ██╗██╗   ██╗███████╗",
        "████╗  ██║██╔════╝╚██╗██╔╝██║   ██║██╔════╝",
        "██╔██╗ ██║█████╗   ╚███╔╝ ██║   ██║███████╗",
        "██║╚██╗██║██╔══╝   ██╔██╗ ██║   ██║╚════██║",
        "██║ ╚████║███████╗██╔╝ ██╗╚██████╔╝███████║",
        "╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝",
      }
    end,
  },
  {
    "gbprod/phpactor.nvim",
    build = function() require "phpactor.handler.update"() end,
    ft = "php",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
    },
    keys = {
      { "<leader>lc", "<cmd>PhpActor context_menu<cr>", desc = "PhpActor context menu", ft = "php" },
      { "<leader>lt", "<cmd>PhpActor transform<cr>", desc = "PhpActor transform", ft = "php" },
      { "<leader>ln", "<cmd>PhpActor new_class<cr>", desc = "PhpActor new class", ft = { "php", "neo-tree" } },
      { "<leader>lm", "<cmd>PhpActor move_class<cr>", desc = "PhpActor move class", ft = { "php", "neo-tree" } },
    },
    opts = {},
  },
}
