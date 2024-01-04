return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    -- stylua: ignore start
    {"<a-1>", function() require("harpoon.ui").nav_file(1) end, desc = "Harpoon file 1"},
    {"<a-2>", function() require("harpoon.ui").nav_file(2) end, desc = "Harpoon file 2"},
    {"<a-3>", function() require("harpoon.ui").nav_file(3) end, desc = "Harpoon file 3"},
    {"<a-4>", function() require("harpoon.ui").nav_file(4) end, desc = "Harpoon file 4"},
    {"<a-5>", function() require("harpoon.ui").nav_file(5) end, desc = "Harpoon file 5"},
    {"<a-6>", function() require("harpoon.ui").nav_file(6) end, desc = "Harpoon file 6"},

    {"<a-7>", function() require("harpoon.ui").nav_next() end, desc = "Harpoon next file"},
    {"<a-8>", function() require("harpoon.ui").nav_prev() end, desc = "Harpoon prev file"},

    {"<a-9>", function() require("harpoon.ui").toggle_quick_menu() end, desc = "Harpoon menu"},
    {"<a-0>", function() require("harpoon.mark").add_file() end, desc = "Harpoon add file"},
    -- stylua: ignore end
  },
  config = function()
    require("harpoon").setup()

    require("telescope").load_extension("harpoon")
  end,
}
