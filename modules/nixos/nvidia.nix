{ config, lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    libsForQt5.qt5.qtwayland
    libsForQt5.qt5ct
    libva
  ];
  
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [ 
      mesa_git
      vulkan-loader
      vulkan-tools
    ];
  };

  services.xserver = {
    enable = true;
    videoDrivers = [ "modesetting" ];
  };

  # If you encounter the problem of booting to text mode you might try adding the Nvidia kernel module manually with:
  # boot.initrd.kernelModules = [ "nvidia" ];
  # boot.extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];

  # hardware.nvidia = {
  #   modesetting.enable = true;
  #   powerManagement.enable = true;
  #   powerManagement.finegrained = false;
  #   open = false;
  #   nvidiaSettings = true;
  #   forceFullCompositionPipeline = true;
  #   package = config.boot.kernelPackages.nvidiaPackages.stable;
  # };

  # boot.kernelModules = [
  #   "nvidia"
  #   "nvidia_modeset"
  #   "nvidia_uvm"
  #   "nvidia_drm"
  # ];

  # boot.kernelParams = [
  #   "nvidia-drm.modeset=1"
  #   "nvidia-drm.fbdev=1"
  #   "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
  # ];
}
