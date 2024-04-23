{ config, pkgs, input, ... }:
{
  home.packages = with pkgs; [
    neovim
  ];

  xdg.enable = true;
  xdg.configFile.nvim = {
    source = ./config;
    recursive = true;
  };
}
