{ config, pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
  };
  
  home.file.".config/rofi" = {
    source = ./rofi;
    recursive = true;
  };

  home.file.".config/rofi/shared/theme.rasi".text = with config.colorScheme.palette; ''
* {
    font: "FiraCode Mono Nerd Font 10";
    background:     #${base00};
    background-alt: #${base01};
    foreground:     #${base05};
    selected:       #${base02};
    active:         #${base0A};
    urgent:         #${base0B};
}
'';
}
