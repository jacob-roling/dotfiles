{ pkgs, settings, ... }:
{
  stylix = {
    enable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";

    # Wallpaper
    image = ./wallpapers/ancient.png;

    # polarity = "dark";
    
    fonts = {
      monospace = {
        name = "FiraCode Nerd Font";
        package = pkgs.nerd-fonts.fira-code;
      };
      
      # sansSerif = {
      #   name = "DejaVu Sans";
      #   package = pkgs.dejavu_fonts;
      # };

      # serif = {
      #   name = "DejaVu Serif";
      #   package = pkgs.dejavu_fonts;
      # };
    };
    
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
    };
  };
}