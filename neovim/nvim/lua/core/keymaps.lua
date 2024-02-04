local utils = require("core.utils")

local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  vim.keymap.set(mode, lhs, rhs, opts)
end

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

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

map({ "n", "x" }, "gw", "*N", { desc = "Search word under cursor", remap = true })

-- Clear search and escape
map({ "i", "n", "v" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Clear search and escape" })
map({ "i", "n", "v" }, "jk", "<cmd>noh<cr><esc>", { desc = "Clear search and escape" })
map({ "t" }, "jk", "<c-\\><c-n>", { desc = "Escape terminal" })

-- Clear search, diff update and redraw
map(
  "n",
  "<leader>ur",
  "<cmd>nohlsearch<bar>diffupdate<bar>normal! <C-L><cr>",
  { desc = "Redraw / clear hlsearch / diff update" }
)

-- Copy/paste with system clipboard
map({ "n", "x" }, "gy", '"+y', { desc = "Copy to system clipboard" })
map("n", "gp", '"+p', { desc = "Paste from system clipboard" })
map("x", "gp", '"+P', { desc = "Paste from system clipboard" }) -- Paste in Visual with `P` to not copy selected text (`:h v_P`)

-- Windows
map("n", "<leader>wj", "<C-W>s", { desc = "Window split down", remap = true })
map("n", "<leader>wl", "<C-W>v", { desc = "Window split right", remap = true })

-- Tabs
map("n", "<leader>wt", "<cmd>tabnew<cr>", { desc = "Tab new" })
map("n", "<leader>wd", "<cmd>tabclose<cr>", { desc = "Tab close" })
map("n", "[t", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
map("n", "]t", "<cmd>tabnext<cr>", { desc = "Next Tab" })

-- Terminal
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to right window" })
map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })

-- Better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Save file
map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- New file
map("n", "<leader>n", "<cmd>ene<cr>", { desc = "New file" })

-- Toggle options
map("n", "<leader>uw", function()
  utils.toggle_option("wrap")
end, { desc = "Toggle Word Wrap" })
