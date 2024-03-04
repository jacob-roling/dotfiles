{ pkgs, inputs, config, ... }:
{
  services.dunst = {
    enable = true;
    settings = with config.colorScheme.palette; {
      global = {
        font = "FiraCode Nerd Font";
      };

      urgency_normal = {
        background = "#${base00}";
        foreground = "#${base05}";
        timeout = 10;
      };
    };
  };
}
