{ ... }:
{
  xdg.configFile."nvim/" = {
    source = ../../../../.config/nvim;
    recursive = true;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
}