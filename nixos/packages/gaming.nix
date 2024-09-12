{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    lutris
    godot_4
    protonup-qt
    xorg.xwininfo
    xdotool
    yad
    vim-full
    mangohud
    #wine-staging
    winetricks
    protontricks

    # steamtinkerlaunch
    (retroarch.override {
      cores = with libretro; [
        desmume
      ];
    })
  ];

  # Steam
  programs.steam = {
    enable = true;
  };

  # XBox Accessories
  hardware.xone.enable = true;
  hardware.xpadneo.enable = true;

  # xpad + 8BitDo Ultimate Wireless Bluetooth 
  boot.extraModulePackages = [
    (config.boot.kernelPackages.callPackage ./xpad.nix {})
  ];
  services.udev.extraRules = ''
ACTION=="add", \
  ATTRS{idVendor}=="2dc8", \
  ATTRS{idProduct}=="3106", \
  RUN+="${pkgs.kmod}/bin/modprobe xpad", \
  RUN+="${pkgs.bash}/bin/sh -c 'echo 2dc8 3106 > /sys/bus/usb/drivers/xpad/new_id'"
'';
}
