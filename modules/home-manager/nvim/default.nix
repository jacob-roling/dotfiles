{ config, pkgs, input, ... }:
{
  home.packages = with pkgs; [
    neovim
  ];

  xdg.configFile.nvim = {
    enable = true;
    source = ./config;
    recursive = true;
  };
}
