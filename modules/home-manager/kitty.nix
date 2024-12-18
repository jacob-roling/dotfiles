{ pkgs, settings, ... }:
{
  programs.kitty = {
    enable = true;

    settings = {
      enable_audio_bell = "no";
      kitty_mod = "ctrl+b";
    };

    keybindings = {
      "kitty_mod+enter" = "launch --cwd=current";
      "kitty_mod+q" = "close_window";
    };
  };
}