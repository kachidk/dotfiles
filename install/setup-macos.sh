#!/bin/bash

# Specify the path to your dotfiles directory
dotfiles_dir="$HOME/dotfiles"

# Specify the path to your dotfiles backup directory
backup_dir="$HOME/dotfiles_backup"

create_link "$dotfiles_dir/wezterm" "$HOME/.config/wezterm"
create_link "$dotfiles_dir/neovim/nvim" "$HOME/.config/nvim"
