return {
  "nvim-pack/nvim-spectre",
  cmd = "Spectre",
  opts = { open_cmd = "noswapfile vnew" },
  keys = {
    {
      "<leader>sr",
      function()
        require("spectre").open()
      end,
      desc = "Open Spectre",
    },
    {
      "<leader>sR",
      function()
        require("spectre").open_file_search()
      end,
      desc = "Open Spectre (current file)",
    },
  },
}
