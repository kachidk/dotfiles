return {
  "iamcco/markdown-preview.nvim",
  ft = { "markdown" },
  build = "cd app && npm install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  keys = {
    { "<leader>pm", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview" },
  },
}
