{ pkgs, inputs, config, ... }:
{
  services.dunst = {
    enable = true;
    settings = with config.colorScheme.palette; {
      global = {
        font = "FiraCode Nerd Font";
        frame_width = 1;
        frame_color = "#${base03}";
        offset = "16x16";
        corner_radius = 4;
      };

      urgency_normal = {
        background = "#${base00}";
        foreground = "#${base05}";
        timeout = 10;
      };
    };
  };
}
