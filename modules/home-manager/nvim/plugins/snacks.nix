{
  programs.nixvim = {
    plugins.snacks = {
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
              indent = 2;
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
  };
}