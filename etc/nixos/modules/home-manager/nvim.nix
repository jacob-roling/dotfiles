{ ... }:
{
  xdg.configFile."test" = {
    source = ../../../../.config/nvim;
    recursive = true;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
}
