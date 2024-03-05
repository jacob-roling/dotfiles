{ config, pkgs, ... }:
{
  # xdg.configFile."nvim" = {
  #   source = config.lib.file.mkOutOfStoreSymlink ../../../../.config/nvim;
  #   recursive = true;
  # };

  # home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "$HOME/dotfiles/.config/nvim";
 
  programs.nixvim = {
    enable = true;
    
    colorschemes.base16 = {
      enable = true;
      customColorScheme = with config.colorScheme.palette; {
        base00 = "#${base00}";
        base01 = "#${base01}";
        base02 = "#${base02}";
        base03 = "#${base03}";
        base04 = "#${base04}";
        base05 = "#${base05}";
        base06 = "#${base06}";
        base07 = "#${base07}";
        base08 = "#${base08}";
        base09 = "#${base09}";
        base0A = "#${base0A}";
        base0B = "#${base0B}";
        base0C = "#${base0C}";
        base0D = "#${base0D}";
        base0E = "#${base0E}";
        base0F = "#${base0F}";
      };
    };

    clipboard.providers = {
      wl-copy.enable = true;
    };

    plugins = {
      lsp = {
        enable = true;
        servers = {
          tsserver.enable = true;
          lua-ls.enable = true;
          rust-analyzer = {
	    enable = true;
	    installRustc = false;
	    installCargo = false;
	  };
          gopls.enable = true;
        };
      };
    };

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
