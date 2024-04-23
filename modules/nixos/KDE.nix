{
  config,
  pkgs,
  ...
}: {
  # services.xserver = {
  #   enable = true;
  #   libinput.enable = true;
    
  #   displayManager = {
  #     sddm = {
  #       enable = true;
  #     };
  #   };

  #   desktopManager.plasma5.enable = true;

  #   excludePackages = with pkgs; [ xterm ];
  # };

  # environment.plasma5.excludePackages = with pkgs.libsForQt5; [
  #   plasma-browser-integration
  #   konsole
  #   oxygen
  # ];

  services = {
    desktopManager.plasma6.enable = true;

    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
      };

      defaultSession = "plasma";
    };
  };

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    konsole
    oxygen
  ];

  programs.dconf.enable = true;

  environment.sessionVariables = {
    NIX_PROFILES = "${pkgs.lib.concatStringsSep " " (pkgs.lib.reverseList config.environment.profiles)}";
  };
}
