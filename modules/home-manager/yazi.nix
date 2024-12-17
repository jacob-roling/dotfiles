{ pkgs, ... }:
{
  programs = {
    yazi = {
      enable = true;
      settings = {};
      plugins = {};
    };

    zsh.shellAliases = {
      fm = "yazi";
    };
  };
}