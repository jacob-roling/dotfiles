{ config, pkgs, input, ... }:
{
  home.packages = with pkgs; [
    zoxide
  ];

  programs.zsh = {
    enable = true;
    
    syntaxHighlighting.enable = true;
    
    shellAliases = {
      top = "btm";
      ls = "lsd -A -1 --git";
      grep = "rg";
      code = "codium";
      fm = "yazi";
    };

    shellInit = ''
      eval "$(starship init zsh)"
      eval "$(zoxide init --cmd cd zsh)"
      eval "$(direnv hook zsh)"
    '';
  };
}
