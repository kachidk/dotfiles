return {
  "numToStr/Comment.nvim",
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")
    require("Comment").setup({
      pre_hook = ts_context_commentstring.create_pre_hook(),
    })
    vim.g.skip_ts_context_commentstring_module = true
  end,
}
