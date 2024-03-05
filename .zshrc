# Bottom
alias top="btm"
# lsd
alias ls="lsd -A -1 --git"
# ripgrep
alias grep="rg"
alias rebuild="sudo nixos-rebuild switch --flake ~/dotfiles/etc/nixos#desktop"

eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(direnv hook zsh)"
