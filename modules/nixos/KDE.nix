{
  config,
  pkgs,
  ...
}: {
  services.xserver = {
    # enable = true;
    # libinput.enable = true;
    
    # displayManager = {
    #   sddm = {
    #     enable = true;
    #     wayland.enable = true;
    #   };
      
    #   defaultSession = "plasma";
    # };

    # desktopManager.plasma5.enable = true;

    excludePackages = with pkgs; [ xterm ];
  };

  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
    };  
    
    defaultSession = "plasma";
  };

  services.desktopManager.plasma6.enable = true;
  
  # environment.plasma5.excludePackages = with pkgs.libsForQt5; [
  #   plasma-browser-integration
  #   konsole
  #   oxygen
  # ];

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
