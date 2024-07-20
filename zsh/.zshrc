eval "$(starship init zsh)"

# Aliases

alias dpodre="devpod up --dotfiles github.com/ritchieflick/dotfiles --recreate --ide none"
alias dpodssh='devpod ssh --command "git config --global --add safe.directory /workspaces/$(basename $(pwd)) && nix develop"'
