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
