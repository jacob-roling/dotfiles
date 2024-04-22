{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    lutris
    (retroarch.override {
      cores = with libretro; [
        desmume
      ];
    })
    godot
  ];

  # Steam
  programs.steam.enable = true;

  # XBox Accessories
  hardware.xone.enable = true;
}
