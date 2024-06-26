{ pkgs, settings, ... }:
{
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/background".picture-uri = "/home/${settings.username}/Pictures/wallpaper.jpg";
      "org/gnome/desktop/interface".color-scheme = "prefer-dark";
    };
  };

  gtk = {
    enable = true;

    iconTheme = {
      name = "kora";
      package = pkgs.kora-icon-theme;
    };

    # theme = {
    #   name = "Colloid";
    #   package = pkgs.colloid-gtk-theme.override {
    #     tweaks = ["normal"];
    #     colorVariants = ["dark"];
    #   };
    # };

    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };

  # home.sessionVariables.GTK_THEME = "Colloid";
}