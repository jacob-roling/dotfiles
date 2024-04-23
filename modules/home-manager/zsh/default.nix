{ config, pkgs, input, ... }:
{
  home.packages = with pkgs; [
    zoxide
  ];
  
  home.file.".zshrc".source = ./.zshrc;
}
