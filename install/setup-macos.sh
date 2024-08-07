#!/bin/bash

# Specify the path to your dotfiles directory
dotfiles_dir="$HOME/dotfiles"

# Specify the path to your dotfiles backup directory
backup_dir="$HOME/dotfiles_backup"

create_link "$dotfiles_dir/wezterm" "$HOME/.config/wezterm"
create_link "$dotfiles_dir/neovim/astronvim" "$HOME/.config/astronvim"
create_link "$dotfiles_dir/neovim/lazyvim" "$HOME/.config/lazyvim"
create_link "$dotfiles_dir/zsh/.zshrc" "$HOME/.zshrc"
create_link "$dotfiles_dir/oh-my-posh/theme.omp.json" "$HOME/theme.omp.json"
create_link "$dotfiles_dir/lazygit/config.yml" "$HOME/Library/Application Support/lazygit/config.yml"
create_link "$dotfiles_dir/tmux/.tmux.conf" "$HOME/.tmux.conf"
