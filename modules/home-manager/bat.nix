{ ... }:
{
  programs = {
    home-manager.enable = true;

    bat = {
      enable = true;
    };

    zsh.shellAliases = {
      cat = "bat";
    };
  };

  home.sessionVariables = {
    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
    MANROFFOPT = "-c";
  };
}