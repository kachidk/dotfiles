vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.completeopt = "menuone,noselect"
vim.opt.termguicolors = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.showmode = false
vim.opt.showcmd = false
vim.opt.ruler = false
vim.opt.fillchars.eob = " "
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.fileignorecase = false
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.iskeyword:append("-")
vim.opt.shortmess:append({ s = true, I = true })
vim.opt.splitright = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

if vim.fn.has("win32") then
  vim.opt.clipboard = "unnamed,unnamedplus"
  vim.opt.shell = "pwsh.exe"
  vim.opt.shellcmdflag =
    "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
  vim.cmd([[
    let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
    let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
    set shellquote= shellxquote=
  ]])
end
