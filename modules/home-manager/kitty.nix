{ pkgs, settings, ... }:
{
  programs.kitty = {
    enable = true;

    settings = {
      clear_all_shortcuts = true;
      enable_audio_bell = "no";
    };

    keybindings = {
      "kitty_mod+enter" = "launch --cwd=current";
      "kitty_mod+q" = "close_window";
    };
  };
}