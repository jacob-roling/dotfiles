{ config, lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    qt5-wayland
    qt5ct
    libva
    libva-nvidia-driver-git
  ];
  
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
