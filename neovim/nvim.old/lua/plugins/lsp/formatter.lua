return {
  "mhartington/formatter.nvim",
  config = function()
    require("formatter").setup({
      filetype = {
        lua = {
          require("formatter.filetypes.lua").stylua,
        },
        typescript = {
          require("formatter.defaults.prettierd"),
        },
        typescriptreact = {
          require("formatter.defaults.prettierd"),
        },
        javascript = {
          require("formatter.defaults.prettierd"),
        },
        javascriptreact = {
          require("formatter.defaults.prettierd"),
        },
        json = {
          require("formatter.defaults.prettierd"),
        },
        vue = {
          require("formatter.defaults.prettierd"),
        },
        php = {
          require("formatter.defaults.prettierd"),
        },
        css = {
          require("formatter.defaults.prettierd"),
        },
        scss = {
          require("formatter.defaults.prettierd"),
        },
        markdown = {
          require("formatter.defaults.prettierd"),
        },
      },
    })

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      command = "FormatWriteLock",
    })
  end,
}
