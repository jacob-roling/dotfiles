{ config, lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    libsForQt5.qt5.qtwayland
    qt5ct
    libva
  ];
  
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  services.xserver = {
    enable = true;
    videoDrivers = ["nvidia"];
    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
      };
    };
  };

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    # forceFullCompositionPipeline = true;
  };

  boot.kernelModules = [
    "nvidia_uvm"
    "nvidia_modeset"
    "nvidia_drm"
    "nvidia"
  ];

  boot.kernelParams = [
    "nvidia-drm.modeset=1"
  ];
}
