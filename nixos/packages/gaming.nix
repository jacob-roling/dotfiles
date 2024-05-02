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
    (retroarch.override {
      cores = with libretro; [
        desmume
      ];
    })
  ];

  # Steam
  programs.steam.enable = true;

  # XBox Accessories
  hardware.xone.enable = true;
}
