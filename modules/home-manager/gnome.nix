{ pkgs, ... }:
{
  dconf = {
    enable = true;
    settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
  };

  gtk = {
    enable = true;

    iconTheme = {
      name = "kora";
      package = pkgs.kora-icon-theme;
    };

    theme = {
      name = "Colloid";
      package = (pkgs.colloid-gtk-theme.override {
        tweaks = [
          "normal"
        ];
      });
    };

    cursorTheme = {
      name = "Bibata Modern";
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

  home.sessionVariables.GTK_THEME = "Colloid";
}