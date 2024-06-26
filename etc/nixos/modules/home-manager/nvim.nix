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
      shiftwidth = 2;
      tabstop = 2;
			expandtab = true;
			smartindent = true;
    };

    keymaps = [
      {
        action = "require('mini.files').open";
        key = "<leader>o";
        lua = true;
        mode = "n";
      }
      {
        action = "<cmd>w<CR>";
        key = "<C-s>";
        mode = ["n" "v" "i"];
      }
    ];

    autoCmd = [
      {
        event = ["BufWritePre"];
        pattern = ["*"];
        command = "lua vim.lsp.buf.format()";
      }
    ];

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
	        "<leader>fw" = {
	          action = "live_grep";
	          desc = "Telescope find words";
	        };
	        "<leader>ff" = {
	          action = "find_files";
	          desc = "Telescope find files";
	        };
	        "<leader>fg" = {
	          action = "git_files";
	          desc = "Telescope find Git files";
	        };
	          "<leader>fb" = {
	          action = "buffers";
	          desc = "Telescope find buffers";
	        };
        };

	      extensions.fzf-native.enable = true;
      };

      # oil = {
      #   enable = true;
      #   keymaps = {
      #     "<leader>f" = "actions.open_cwd";
      #   };
      # };

      mini = {
        enable = true;
	      modules = {
	        files = {};
	        surround = {};
	        pairs = {};
	        starter = {};
	        ai = {};
	      };
      };

      emmet = {
        enable = true;
        # extraConfig = {
        #    leader_key = "<C-y>";
        # };
      };
      
      treesitter.enable = true;
      
      which-key.enable = true;
      
      lualine.enable = true;
      
      ts-autotag.enable = true;

      harpoon = {
        enable = true;
	      enableTelescope = true;

	      keymaps = {
	        toggleQuickMenu = "<C-q>";
	        addFile = "<C-a>";
	        navFile = {
	          "1" = "<C-h>";
	         "2" = "<C-j>";
	         "3" = "<C-k>";
	         "4" = "<C-l>";
	        };
	      };
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
					html.enable = true;
					# htmx.enable = true;
					tailwindcss.enable = true;
					nil_ls.enable = true;
					astro.enable = true;
					bashls.enable = true;
					emmet_ls.enable = true;
					jsonls.enable = true;
					yamlls.enable = true;
					# templ.enable = true;
        };
      };
    };
  };
}
