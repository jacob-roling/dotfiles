{ config, pkgs, input, ... }:
{
  xdg.configFile."../.zshrc".source = ../../../../.zshrc;
}
