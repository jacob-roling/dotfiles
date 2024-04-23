{ config, pkgs, input, ... }:
{
  environment.systemPackages = with pkgs [
    neovim
  ];
  
  xdg.configFile."nvim".source = ./config;
}
