eval "$(oh-my-posh init zsh --config ~/theme.omp.json)"

xampp(){
  command sudo /Applications/XAMPP/xamppfiles/xampp "$@"
}

alias lg="lazygit"

export EDITOR="code -w"

alias pa="php artisan"

alias pat="php artisan tinker"

alias patt="while true; do php artisan tinker; done"

export ANDROID_HOME=$HOME/Library/Android/sdk

export PATH=$PATH:$ANDROID_HOME/emulator

export PATH=$PATH:$ANDROID_HOME/platform-tools

emulator_android(){
  avd=$(emulator -list-avds 2>&1 | head -n 1)
  command emulator -avd "$avd"
}

emulator_ios(){
  command open -a simulator 
}

# pnpm
export PNPM_HOME="/Users/Victor/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

alias rr="ranger"

alias phpstorm='open -na "PhpStorm.app" --args'

alias webstorm='open -na "WebStorm.app" --args'

export PATH="$HOME/.composer/vendor/bin:$PATH"

alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"

eval $(thefuck --alias)
eval $(thefuck --alias fk)

alias yt-dlp='yt-dlp --output "~/Downloads/%(title)s.%(ext)s"'
alias vl='yt-dlp'
alias pl='yt-dlp --output "~/Downloads/%(playlist_title)s/%(playlist_index)s-%(title)s.%(ext)s"'

export PATH="$HOME/.local/bin:$PATH"

get_pocketbase() {
  local version=${1:-0.22.16}
  local folder_name=${2:-pocketbase}
  local url="https://github.com/pocketbase/pocketbase/releases/download/v${version}/pocketbase_${version}_darwin_amd64.zip"
  local temp_dir=$(mktemp -d)
  
  wget -O "$temp_dir/pocketbase.zip" "$url" && \
  unzip "$temp_dir/pocketbase.zip" -d "$temp_dir" && \
  mkdir -p "$folder_name" && \
  mv "$temp_dir/pocketbase" "$folder_name/"
  
  rm -rf "$temp_dir"
  echo "PocketBase binary has been saved to the $folder_name folder."
}

alias nvim='NVIM_APPNAME=lazyvim nvim'

alias lvim='NVIM_APPNAME=lazyvim nvim'

alias avim='NVIM_APPNAME=astronvim nvim'
