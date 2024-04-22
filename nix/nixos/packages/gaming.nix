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
  ];

  # Steam
  programs.steam.enable = true;

  # XBox Accessories
  hardware.xone.enable = true;
}
