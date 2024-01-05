return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local icons = require("core.icons")

    local cwd = function()
      return icons.FolderClosed .. " " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
    end

    require("lualine").setup({
      options = {
        globalstatus = true,
        disabled_filetypes = { "alpha", "dashboard" },
        theme = require("core.env").colorscheme,
        component_separators = "|",
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = {
          { "mode", separator = { left = "" }, right_padding = 2 },
        },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "encoding", "fileformat", "filetype", cwd },
        lualine_z = {
          { "location", separator = { right = "" }, left_padding = 2 },
        },
      },
    })
  end,
}
