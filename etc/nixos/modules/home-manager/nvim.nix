{ config, ... }:
{
  # xdg.configFile."nvim" = {
  #   source = ../../../../.config/nvim;
  #   recursive = true;
  # };

  home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink ../../../../.config/nvim;
 
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
}
