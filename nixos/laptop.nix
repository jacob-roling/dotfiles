{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  settings,
  ...
}: {
  imports = [
    ./common.nix
    ../hardware-configurations/laptop/hardware-configuration.nix
    # Custom NixOS Modules
    outputs.nixosModules.hyprland
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    extraSpecialArgs = {inherit inputs outputs settings;};
    
    users = {
      "${settings.username}" = import ../home-manager/laptop.nix;
    };

    backupFileExtension = "backup";
  };

  # Fingerprint Driver
  services.fprintd.enable = true;
  environment.systemPackages = with pkgs; [
    # (callPackage ../drivers/framework-fingerprint-driver.nix {})
  ];
  # services.fprintd.tod.enable = true;
  # services.fprintd.tod.driver = pkgs.libfprint-2-tod1-goodix;

  # Intel Accelerated Video Playback

  nixpkgs.config.packageOverrides = pkgs: {
    intel-vaapi-driver = pkgs.intel-vaapi-driver.override { enableHybridCodec = true; };
  };

  hardware.graphics = { # hardware.graphics on unstable
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      intel-vaapi-driver # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      libvdpau-va-gl
    ];
  };

  environment.sessionVariables = { LIBVA_DRIVER_NAME = "iHD"; }; # Force intel-media-driver
  
  networking.hostName = "laptop";
}
