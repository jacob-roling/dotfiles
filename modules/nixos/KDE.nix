{
  config,
  pkgs,
  ...
}: {
  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;

  services.xserver.desktopManager.plasma5.enable = true;
  
  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
    plasma-browser-integration
    konsole
    oxygen
  ];


  # Plasma 6
  # services.desktopManager.plasma6.enable = true;
  # services.xserver.displayManager.sddm.wayland.enable = true;
  # services.xserver.displayManager.defaultSession = "plasma";

  # environment.plasma6.excludePackages = with pkgs.kdePackages; [
  #   plasma-browser-integration
  #   konsole
  #   oxygen
  # ];

  programs.dconf.enable = true;

  environment.sessionVariables = {
    NIX_PROFILES = "${pkgs.lib.concatStringsSep " " (pkgs.lib.reverseList config.environment.profiles)}";
  };
}
