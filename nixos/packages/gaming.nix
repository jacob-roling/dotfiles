{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    lutris
    godot_4
    protonup-qt
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
