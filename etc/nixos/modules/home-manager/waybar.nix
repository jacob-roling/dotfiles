{ pkgs, inputs, config, ... }:
{
  xdg.configFile."waybar/config.jsonc".source = ../../../../.config/waybar/config.jsonc;
  xdg.configFile."waybar/style.css".source = ../../../../.config/waybar/style.css;

  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };
}
