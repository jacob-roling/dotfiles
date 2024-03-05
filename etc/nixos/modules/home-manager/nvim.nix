{ config, pkgs, ... }:
{
  # xdg.configFile."nvim" = {
  #   source = config.lib.file.mkOutOfStoreSymlink ../../../../.config/nvim;
  #   recursive = true;
  # };

  # home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "$HOME/dotfiles/.config/nvim";
 
  programs.nixvim = {
    enable = true;
    # defaultEditor = true;
    
    # viAlias = true;
    # vimAlias = true;
    # vimdiffAlias = true;
    
    # plugins = with pkgs.vimPlugins; [
    #   telescope-nvim
    #   nvim-treesitter
    #   cmp-treesitter
    #   completion-treesitter
    #   nvim-cmp
    #   nvim-lspconfig
    #   emmet-vim
    #   mini-nvim
    #   which-key-nvim
    #   oil-nvim
    #   neoscroll-nvim
    # ];
  };
}
