{ ... }:
{
  xdg.configFile."nvim".source = ../../../../.config/nvim;
  xdg.configFile."nvim".recursive = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
}
