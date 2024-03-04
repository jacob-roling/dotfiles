{ config, pkgs, input, ... }:
{
  xdg.configFile.".zshrc".source = ../../../../.zshrc;

  programs.zsh = {
    enable = true;
  };
}
