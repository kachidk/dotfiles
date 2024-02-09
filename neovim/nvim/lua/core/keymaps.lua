local utils = require("core.utils")

local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  vim.keymap.set(mode, lhs, rhs, opts)
end

vim.g.mapleader = " "

-- Better up/down for i.e navigating wrapped lines
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Escape
map("i", "jj", "<esc>", { desc = "Escape insert" })

-- Clear search highlighting
map("n", "<leader>h", "<cmd>noh<cr>", { desc = "No Highlight" })

-- Windows
map("n", "\\", "<C-W>s", { desc = "Window split down", remap = true })
map("n", "|", "<C-W>v", { desc = "Window split right", remap = true })

-- Tabs
map("n", "<leader>N", "<cmd>tabnew<cr>", { desc = "New tab" })
map("n", "<leader>C", "<cmd>tabclose<cr>", { desc = "Close tab" })
map("n", "[t", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
map("n", "]t", "<cmd>tabnext<cr>", { desc = "Next Tab" })

-- Terminal
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to right window" })

-- Save
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })

-- Quit
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })

-- Better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- New file
map("n", "<leader>n", "<cmd>ene<cr>", { desc = "New file" })

-- Toggle options
map("n", "<leader>uw", function()
  utils.toggle_option("wrap")
end, { desc = "Toggle Word Wrap" })
