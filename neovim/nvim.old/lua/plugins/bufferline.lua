return {
  "akinsho/bufferline.nvim",
  version = "v4.3.0",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "moll/vim-bbye",
  },
  event = "VeryLazy",
  keys = {
    { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
    { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
    { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
    { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
    { "<b", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer left" },
    { ">b", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer right" },
    { "<leader>bb", "<cmd>BufferLinePick<cr>", desc = "Select buffer from bufferline" },
    { "<leader>bq", "<cmd>BufferLinePickClose<cr>", desc = "Delete buffer from bufferline" },
    { "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Delete all buffers except current" },
  },
  config = function()
    local bufferline = require("bufferline")
    local icons = require("utils.icons")
    bufferline.setup({
      options = {
        always_show_bufferline = false,
        indicator = { style = "none" },
        close_command = "Bdelete %d",
        right_mouse_command = false,
        middle_mouse_command = false,
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = true,
        diagnostics_indicator = function(_, _, diag)
          local ret = (diag.error and icons.DiagnosticError .. " " .. diag.error .. " " or "")
            .. (diag.warning and icons.DiagnosticWarn .. " " .. diag.warning or "")
          return vim.trim(ret)
        end,
        offsets = {
          {
            filetype = "neo-tree",
            highlight = "Directory",
          },
        },
      },
    })
  end,
}
