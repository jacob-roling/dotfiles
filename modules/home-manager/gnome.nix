{ pkgs, settings, ... }:
{
  home.packages = (with pkgs; [
    emote
  ]) ++ (with pkgs.gnomeExtensions; [
    appindicator
    pano
    quick-settings-tweaker
    arc-menu
    wiggle
    blur-my-shell
    caffeine
    auto-activities
    tiling-shell
  ]) ++ (with pkgs.gnome; [
  ]);

  dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false; # enables user extensions
        enabled-extensions = with pkgs.gnomeExtensions; [
          appindicator.extensionUuid
          pano.extensionUuid
          quick-settings-tweaker.extensionUuid
          arc-menu.extensionUuid
          wiggle.extensionUuid
          blur-my-shell.extensionUuid
          caffeine.extensionUuid
          auto-activities.extensionUuid
          tiling-shell.extensionUuid
        ];
      };
    };
  };

  gtk = {
    enable = true;

    iconTheme = {
      name = "kora";
      package = pkgs.kora-icon-theme;
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
}