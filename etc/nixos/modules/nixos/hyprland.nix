{ inputs, config, pkgs, ... }:
{
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  environment.systemPackages = with pkgs; [
    # Notifications
    dunst
    libnotify
    # Menu
    wofi
    # Wallpaper
    swww
  ];

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
}
