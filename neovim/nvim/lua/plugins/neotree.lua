return {
  enabled = false,
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Explorer" },
    { "<leader>ge", "<cmd>Neotree git_status toggle<cr>", desc = "Git explorer" },
    { "<leader>be", "<cmd>Neotree buffers toggle<cr>", desc = "Buffer explorer" },
  },
  config = function()
    local icons = require("core.icons")

    require("neo-tree").setup({
      close_if_last_window = true,
      sources = { "filesystem", "git_status", "buffers" },
      window = {
        mappings = {
          ["<space>"] = false,
        },
      },
      default_component_configs = {
        indent = { padding = 0 },
        icon = {
          folder_closed = icons.FolderClosed,
          folder_open = icons.FolderOpen,
          folder_empty = icons.FolderEmpty,
          folder_empty_open = icons.FolderEmpty,
          default = icons.DefaultFile,
        },
        modified = { symbol = icons.FileModified },
        git_status = {
          symbols = {
            added = icons.GitAdd,
            deleted = icons.GitDelete,
            modified = icons.GitChange,
            renamed = icons.GitRenamed,
            untracked = icons.GitUntracked,
            ignored = icons.GitIgnored,
            unstaged = "",
            staged = icons.GitStaged,
            conflict = icons.GitConflict,
          },
        },
      },
      filesystem = {
        follow_current_file = { enabled = true },
        hijack_netrw_behavior = "open_current",
        use_libuv_file_watcher = true,
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = false,
          hide_by_name = { ".git" },
        },
      },
    })
  end,
}
