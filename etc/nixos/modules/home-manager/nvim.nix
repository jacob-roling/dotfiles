{ ... }:
{
  xdg.configFile."test" = {
    source = ../../../../.config/nvim;
    recursive = false;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
}
