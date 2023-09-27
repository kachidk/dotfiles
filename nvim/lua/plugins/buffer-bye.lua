return {
  "moll/vim-bbye",
  keys = {
    { "<leader>q", "<cmd>Bdelete<cr>", desc = "Delete buffer" },
    { "<leader>Q", "<cmd>Bdelete!<cr>", desc = "Delete buffer (force)" },
    { "<leader>bQ", "<cmd>silent bufdo <bar> Bdelete<cr>", desc = "Delete all buffers" },
  },
}
