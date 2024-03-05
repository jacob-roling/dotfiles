{ config, ... }:
{
  # xdg.configFile."nvim" = {
  #   source = ../../../../.config/nvim;
  #   recursive = true;
  # };

  home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink ~/dotfiles/.config/nvim;
 
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
}
