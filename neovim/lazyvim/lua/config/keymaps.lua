-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("n", "<leader>o", ":Telescope find_files<cr>", { desc = "Find files", silent = true })

map("n", "<leader>K", ":Telescope file_browser<cr>", { desc = "File browser", silent = true })

map(
  "n",
  "<leader>k",
  ":Telescope file_browser path=%:p:h select_buffer=true<cr>",
  { desc = "File browser (buffer)", silent = true }
)
