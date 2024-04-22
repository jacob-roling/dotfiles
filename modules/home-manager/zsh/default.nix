{ config, pkgs, input, ... }:
{
  programs.zoxide.enable = true;
  xdg.configFile."../.zshrc".source = ./.zshrc;
}
