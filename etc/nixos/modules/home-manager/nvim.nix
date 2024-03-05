{ config, pkgs, ... }:
{
  # xdg.configFile."nvim" = {
  #   source = config.lib.file.mkOutOfStoreSymlink ../../../../.config/nvim;
  #   recursive = true;
  # };

  # home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "$HOME/dotfiles/.config/nvim";
 
  programs.nixvim = {
    enable = true;

    options = {
      number = true;
      relativenumber = true;
    };

    globals.mapleader = " ";

    viAlias = true;
    vimAlias = true;
    
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
      bufferline.enable = true;

      luasnip.enable = true;
      
      cmp-buffer.enable = true;
      cmp-emoji.enable = true;
      cmp-path.enable = true;
      cmp_luasnip.enable = true;

      nvim-cmp = {
        enable = true;
	sources = [
          { name = "nvim_lsp"; }
	  { name = "luasnip"; }
	  { name = "buffer"; }
	  { name = "nvim_lua"; }
	  { name = "path"; }
	];
      };

      telescope = {
        enable = true;
	keymaps = {
	  "<leader>ff" = "live_grep";
	  "<leader>fg" = {
	    action = "git_files";
	    desc = "Telescope Git files";
	  };
	};
	extensions.fzf-native.enable = true;
      };

      oil.enable = true;
      emmet.enable = true;
      treesitter.enable = true;
      which-key.enable = true;

      harpoon = {
        enable = true;
	enableTelescope = true;
      };

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
  };
}
