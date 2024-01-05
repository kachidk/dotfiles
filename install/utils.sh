#!/bin/bash

print_error() {
  # Print output in red
  printf "\e[0;31m  [✖] $1\e[0m\n"
}

print_info() {
  # Print output in blue
  printf "\e[0;34m  [!] $1\e[0m\n"
}

print_warning() {
  # Print output in yellow
  printf "\e[0;33m  [?] $1\e[0m\n"
}

print_success() {
  # Print output in green
  printf "\e[0;32m  [✔] $1\e[0m\n"
}

# Function to create a backup of the target file or directory
backup() {
  local target_file="$1"

  # Create backup directory if it doesn't exist
  mkdir -p "$backup_dir"

  # Move the target file to the backup directory
  mv -f "$target_file" "$backup_dir/$(basename "$target_file").bak"
  print_info "Backed up $target_file to $backup_dir."
}

create_link() {
  local source="$1"
  local destination="$2"

  # Check if the target file or directory already exists
  # and check if it's not a symlink then backup
  if [[ -e "$destination" && ! -L "$destination" ]]; then
    backup "$destination"
  fi

  # Check if the target file or directory already exists
  # and check if it's a symlink then replace
  if [[ -e "$destination" && -L "$destination" ]]; then
    if ln -sfh "$source" "$destination"; then  # Command will throw error if unsuccessful
      print_warning "Replaced symlink $source >> $destination."
    fi
    return
  fi

  # Create the symlink
  if ln -sfh "$source" "$destination"; then  # Command will throw error if unsuccessful
    print_success "Created symlink $source >> $destination."
  fi
}
