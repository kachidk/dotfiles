return {
  "stevearc/aerial.nvim",
  keys = {
    { "<leader>cs", "<cmd>AerialToggle<cr>", desc = "Aerial (Symbols)" },
    { "<leader>cS", "<cmd>Telescope aerial<cr>", desc = "Aerial (Symbols) Telescope" },
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope.nvim",
    { "stevearc/stickybuf.nvim", opts = {} },
  },
  config = function()
    require("aerial").setup({})
    require("telescope").load_extension("aerial")
  end,
}
