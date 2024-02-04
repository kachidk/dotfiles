local function augroup(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end

-- highlight on yank
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "spectre_panel",
    "checkhealth",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- load colorscheme
vim.api.nvim_create_autocmd("VimEnter", {
  group = augroup("load_colorscheme"),
  callback = function()
    vim.cmd.colorscheme(require("core.env").colorscheme)
  end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("last_loc"),
  callback = function(event)
    local exclude = { "gitcommit" }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
      return
    end
    vim.b[buf].lazyvim_last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- two dollars on PHP variables: this can happen because of the `iskeyword` setting in VIM when working with LSP.
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("add_dollar_to_iskeyword"),
  pattern = { "php" },
  callback = function()
    vim.opt.iskeyword:append("$")
  end,
})
