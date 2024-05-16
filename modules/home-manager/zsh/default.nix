{ config, pkgs, input, ... }:
{
  home.packages = with pkgs; [
    zoxide
  ];

  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
  };
  
  home.file.".zshrc".source = ./.zshrc;
}
