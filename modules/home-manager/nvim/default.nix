{ config, pkgs, input, ... }:
{
  home.packages = with pkgs; [
    neovim
  ];
  
  xdg.configFile."nvim".source = ./config;
}
