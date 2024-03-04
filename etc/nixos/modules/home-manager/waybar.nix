{ pkgs, inputs, config, ... }:
{
  xdg.configFile."waybar/config.jsonc".source = ../../../../.config/waybar/config.jsonc;

  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = {};
  };
}
