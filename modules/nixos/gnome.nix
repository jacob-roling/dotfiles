{
  pkgs,
  ...
}: {
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };
  
  environment.systemPackages = (with pkgs; [
    emote
  ]) ++ (with pkgs.gnomeExtensions; [
    appindicator
  ]) ++ (with pkgs.gnome; [
  ]);

  environment.gnome.excludePackages = with pkgs; [
    gnome-photos
    gnome-tour
    gedit
    cheese # webcam tool
    gnome-music
    gnome-terminal
    geary # email reader
    evince # document viewer
    gnome-characters
    totem # video player
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
  ];

  services.udev.packages = with pkgs; [ gnome-settings-daemon ];
}