{ pkgs, ... }:
{
  imports = [
    # ./plugins/gitsigns.nix
    # ./plugins/lsp.nix
    # ./plugins/mini.nix
    # ./plugins/nvim-cmp.nix
    # ./plugins/telescope.nix
    # ./plugins/treesitter.nix
    ./plugins/which-key.nix
  ];

  programs.nixvim = {
    enable = true;
    
    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      mouse = "a";
      showmode = false;

      clipboard = {
        providers = {
          wl-copy.enable = true; # For Wayland
          xsel.enable = true; # For X11
        };

        # Remove this option if you want your OS clipboard to remain independent.
        register = "unnamedplus";
      };

      breakindent = true;

      # Save undo history
      undofile = true;

      # Case-insensitive searching UNLESS \C or one or more capital letters in search term
      ignorecase = true;
      smartcase = true;

      # Keep signcolumn on by default
      signcolumn = "yes";

      # Decrease update time
      updatetime = 250;

      # Decrease mapped sequence wait time
      # Displays which-key popup sooner
      timeoutlen = 300;

      # Configure how new splits should be opened
      splitright = true;
      splitbelow = true;

      # Sets how neovim will display certain whitespace characters in the editor
      #  See `:help 'list'`
      #  See `:help 'listchars'`
      list = true;
      # NOTE: .__raw here means that this field is raw lua code
      listchars.__raw = "{ tab = '» ', trail = '·', nbsp = '␣' }";

      # Preview subsitutions live, as you type!
      inccommand = "split";

      # Show which line your cursor is on
      cursorline = true;

      # Minimal number of screen lines to keep above and below the cursor
      scrolloff = 10;

      # See `:help hlsearch`
      hlsearch = true;
    };

    globals = {
      mapleader = " ";
      maplocalleader = " ";
      have_nerd_font = true;
    };

    plugins = {
      # Adds icons for plugins to utilize in ui
      web-devicons.enable = true;

      # Detect tabstop and shiftwidth automatically
      # https://nix-community.github.io/nixvim/plugins/sleuth/index.html
      sleuth = {
        enable = true;
      };

      snacks = {
        enable = true;
        settings = {
            bigfile = {
              enabled = true;
            };

            dashboard = {
              enabled = true;
              preset = {
                keys = [
                  {
                    action = ":Telescope find_files";
                    key = "f";
                    icon = " ";
                    desc = "Find File";
                  }
                  { 
                    action = ":ene | startinsert";
                    key = "n";
                    icon = " ";
                    desc = "New File";
                  }
                  {
                    action = ":qa";
                    key = "q";
                    icon = " ";
                    desc = "Quit";
                  }
                ];
              };
              sections = [
                { 
                  section = "header";
                }
                { 
                  section = "keys";
                  gap = 1;
                  padding = 1;
                }
                {
                  icon = " ";
                  title = "Recent Files";
                  section = "recent_files";
                  padding = 1;
                }
              ];
            };
            
            indent = {
              enabled = true;
            };

            input = {
              enabled = true;
            };

            notifier = {
              enabled = true;
              timeout = 3000;
            };

            quickfile = {
              enabled = true;
            };

            scroll = {
              enabled = true;
            };

            statuscolumn = {
              enabled = true;
            };
            
            words = {
              enabled = true;
              debounce = 100;
            };
        };
      };

      # Highlight todo, notes, etc in comments
      # https://nix-community.github.io/nixvim/plugins/todo-comments/index.html
      todo-comments = {
        settings = {
          enable = true;
          signs = true;
        };
      };
    };
  };
}
