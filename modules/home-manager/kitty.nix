{ pkgs, settings, ... }:
{
  programs.kitty = {
    enable = true;
    settings = {
      font_family = settings.font.family;
      enable_audio_bell = "no";
    };
  };
}