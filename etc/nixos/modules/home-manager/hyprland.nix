{ inputs, config, pkgs, ... }:
{
  xdg.configFile."hypr/hyprland.conf".source = ../../../../.config/hypr/hyprland.conf;
}
