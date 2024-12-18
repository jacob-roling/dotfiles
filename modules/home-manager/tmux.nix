{ pkgs, ... }:
{
  programs.nixvim = {
    plugins.tmux-navigator = {
      enable  = true;
    };
  };

  programs.tmux = {
    enable = true;
    mouse = true;
    baseIndex = 1;
    sensibleOnTop = true;
    disableConfirmationPrompt = true;
    terminal = "screen-256color";


    plugins = with pkgs.tmuxPlugins; [
      sensible
      vim-tmux-navigator
      yank
    ];

    extraConfig = ''
      bind '"' split-window -v -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"
    '';
  };
}