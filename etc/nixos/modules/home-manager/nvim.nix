{ ... }:
{
  xdg.configFile."nvim".source = ../../../../.config/nvim;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
}
