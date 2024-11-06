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
  };

  # hardware.opengl = {
  #   enable = true;
  #   driSupport = true;
  #   driSupport32Bit = true;
  # };

  services.xserver = {
    enable = true;
    videoDrivers = ["nvidia"];
  };

  # If you encounter the problem of booting to text mode you might try adding the Nvidia kernel module manually with:
  # boot.initrd.kernelModules = [ "nvidia" ];
  # boot.extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
    open = true;
    nvidiaSettings = true;
    forceFullCompositionPipeline = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    # package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
    #   version = "550.100";
    #   sha256_64bit = "sha256-imtfsoe/EfUFZzR4S9pkwQZKCcKqefayJewPtW0jgC0=";
    #   sha256_aarch64 = "sha256-AWHdMtCci8i7maNjVapOT6kyVuFaP81jJyTRLjEyMzo=";
    #   openSha256 = "sha256-3g0f88xGMTB0mx4kVan3ipLtnJFFIKi58ss/1lqC3Sw=";
    #   settingsSha256 = "sha256-cDxhzZCDLtXOas5OlodNYGIuscpKmIGyvhC/kAQaxLc=";
    #   persistencedSha256 = "sha256-gXHBR2+1+YZE2heRArfrZpEF3rO7R92ChuQN+ISpil8=";
    # };
  };

  boot.kernelModules = [
    "nvidia"
    "nvidia_modeset"
    "nvidia_uvm"
    "nvidia_drm"
  ];

  boot.kernelParams = [
    "nvidia-drm.modeset=1"
    "nvidia-drm.fbdev=1"
    "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
    # "nvidia.NVreg_RegistryDwords=\"PowerMizerEnable=0x1; PerfLevelSrc=0x2222; PowerMizerLevel=0x3; PowerMizerDefault=0x3; PowerMizerDefaultAC=0x3\""
  ];
}
