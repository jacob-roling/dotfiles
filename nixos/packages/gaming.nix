{
  config,
  pkgs,
  ...
}: {
  # nixpkgs.config.packageOverrides = pkgs: {
  #   freetype_subpixel = pkgs.freetype.override {
  #     useEncumberedCode = true;
  #   };
  # };

  environment.systemPackages = with pkgs; [
    # lutris
    godot_4
    xorg.xwininfo
    xdotool
    yad
    vim-full
    mangohud
    freetype
    bottles
    wineWowPackages.waylandFull

    (retroarch.override {
      cores = with libretro; [
        desmume
      ];
    })
  ];

  qt.enable = true;
  
  programs = {
    steam = {
      enable = true;
      protontricks.enable = true;
    };

    gamemode = {
      enable = true;
    };

    gamescope = {
      enable = true;
      capSysNice = false;
    };
  };

  environment.sessionVariables.LD_LIBRARY_PATH = with pkgs; [
    "${freetype}/lib"
  ];

  # XBox Accessories
  hardware.xone.enable = true;
  hardware.xpadneo.enable = true;

  # xpad + 8BitDo Ultimate Wireless Bluetooth 
  boot.extraModulePackages = [
    (config.boot.kernelPackages.callPackage ./xpad.nix {})
  ];

  services.udev.extraRules = with pkgs; ''
ACTION=="add", \
  ATTRS{idVendor}=="2dc8", \
  ATTRS{idProduct}=="3106", \
  RUN+="${kmod}/bin/modprobe xpad", \
  RUN+="${bash}/bin/sh -c 'echo 2dc8 3106 > /sys/bus/usb/drivers/xpad/new_id'"
'';
}
