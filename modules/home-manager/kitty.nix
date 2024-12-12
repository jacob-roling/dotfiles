{ pkgs, settings, ... }:
{
  programs.kitty = {
    enable = true;
    settings = {
      enable_audio_bell = "no";
    };
  };
}