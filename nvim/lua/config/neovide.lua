if vim.g.neovide then
  vim.o.guifont = "ComicShannsMono Nerd Font:h12"
  vim.o.title = true
  vim.o.titlestring = "%{fnamemodify(getcwd(), ':t')}"
  vim.g.neovide_cursor_animation_length = 0
  vim.g.neovide_cursor_trail_size = 0
end
