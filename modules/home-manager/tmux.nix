{ pkgs, ... }:
{
  programs.nixvim = {
    plugins.tmux-navigator = {
      enable  = true;
    };
  };

  programs.tmux = {
    enable = true;
    plugins = with pkgs.tmuxPlugins; [
      sensible
      vim-tmux-navigator
    ];
  };
}