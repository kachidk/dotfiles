return {
  "nvim-lualine/lualine.nvim",
  dependencies = { { "nvim-tree/nvim-web-devicons", opts = {} } },
  config = function()
    require("lualine").setup({
      options = {
        globalstatus = true,
        disabled_filetypes = { "alpha", "dashboard" },
        theme = require("env").colorscheme,
      },
      sections = {
        lualine_c = { { "filename", path = 1 } },
      },
    })

    do
      return
    end

    local icons = require("utils.icons")
    local cwd = function()
      return icons.FolderClosed .. " " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
    end

    local my_extension = {}
    my_extension.sections = {
      lualine_a = { "mode" },
      lualine_b = {},
      lualine_c = { "filetype" },
      lualine_x = {},
      lualine_y = {},
      lualine_z = { cwd },
    }
    my_extension.inactive_sections = my_extension.section
    my_extension.filetypes = { "neo-tree", "toggleterm" }

    require("lualine").setup({
      options = {
        globalstatus = true,
        disabled_filetypes = { "alpha", "dashboard" },
      },
      extensions = { my_extension },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
          {
            "diagnostics",
            update_in_insert = true,
            sections = { "error", "warn" },
            symbols = {
              error = icons.DiagnosticError .. " ",
              warn = icons.DiagnosticWarn .. " ",
              info = icons.DiagnosticInfo .. " ",
              hint = icons.DiagnosticHint .. " ",
            },
          },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { "filename", path = 1, symbols = { modified = icons.FileModified, readonly = "", unnamed = "" } },
        },
        lualine_x = {
          {
            "diff",
            symbols = {
              added = icons.GitAdd .. " ",
              modified = icons.GitChange .. " ",
              removed = icons.GitDelete .. " ",
            },
          },
        },
        lualine_y = {},
        lualine_z = { cwd },
      },
      inactive_sections = {
        lualine_a = { "mode" },
        lualine_b = {},
        lualine_c = {
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { "filename", path = 1, symbols = { modified = icons.FileModified, readonly = "", unnamed = "" } },
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = { cwd },
      },
    })
  end,
}
