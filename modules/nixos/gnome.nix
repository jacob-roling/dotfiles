{
  pkgs,
  ...
}: {
  services = {
    libinput = {
      enable = true;

      mouse = {
        accelProfile = "flat";
      };

      touchpad = {
        accelProfile = "flat";
      };
    };
    
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      # displayManager.lightdm.enable = true;
      desktopManager.gnome.enable = true;

      excludePackages = with pkgs; [
        xterm
      ];
    };
  };

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
  services.gnome.gnome-keyring.enable = true;
}