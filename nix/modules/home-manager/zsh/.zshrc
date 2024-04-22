# Bottom
alias top="btm"

# lsd
alias ls="lsd -A -1 --git"

# ripgrep
alias grep="rg"

# code
alias code="codium"

eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(direnv hook zsh)"
