{ config, pkgs, input, ... }:
{
  home.packages = with pkgs; [
    neovim
  ];

  home.file."${config.xdg.configHome}/nvim" = {
    source = ./config;
    recursive = true;
  };
}
