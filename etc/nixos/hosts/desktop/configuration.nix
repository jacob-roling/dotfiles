# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, lib, inputs, ... }:
let
  colorScheme = inputs.nix-colors.colorSchemes.onedark;
in
{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
    ../../modules/nixos/boot.nix
    ../../modules/nixos/amd-cpu.nix
    ../../modules/nixos/nvidia.nix
    ../../modules/nixos/hyprland.nix
    ../../modules/nixos/git.nix
    ../../modules/nixos/rust.nix
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "jacob" = import ./home.nix;
    };
  };

  environment.sessionVariables = rec {
    XDG_CONFIG_HOME = "$HOME/.config";

    BASE00 = "${colorScheme.palette.base00}"; # Default Background
    BASE01 = "${colorScheme.palette.base01}"; # Lighter Background
    BASE02 = "${colorScheme.palette.base02}"; # Selection Background
    BASE03 = "${colorScheme.palette.base03}"; # Comments, Invisibles, Line Highlighting
    BASE04 = "${colorScheme.palette.base04}"; # Dark Foreground (Used for status bars)
    BASE05 = "${colorScheme.palette.base05}"; # Default Foreground, Caret, Delimiters, Operators
    BASE06 = "${colorScheme.palette.base06}"; # Light Foreground (Not often used)
    BASE07 = "${colorScheme.palette.base07}"; # Brightest Foreground (Not often used)
    BASE08 = "${colorScheme.palette.base08}"; # Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
    BASE09 = "${colorScheme.palette.base09}"; # Integers, Boolean, Constants, XML Attributes, Markup Link Url
    BASE0A = "${colorScheme.palette.base0A}"; # Classes, Markup Bold, Search Text Background
    BASE0B = "${colorScheme.palette.base0B}"; # Strings, Inherited Class, Markup Code, Diff Inserted
    BASE0C = "${colorScheme.palette.base0C}"; # Support, Regular Expressions, Escape Characters, Markup Quotes
    BASE0D = "${colorScheme.palette.base0D}"; # Functions, Methods, Attribute IDs, Headings
    BASE0E = "${colorScheme.palette.base0E}"; # Keywords, Storage, Selector, Markup Italic, Diff Changed
    BASE0F = "${colorScheme.palette.base0F}"; # Opening/Closing Embedded Language Tags, e.g. `<?php ?>`
  };
  
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Bluetoothhardware 
  hardware.bluetooth.enable = true; # enables support for Bluetooth 
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Australia/Adelaide";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_AU.UTF-8";
    LC_IDENTIFICATION = "en_AU.UTF-8";
    LC_MEASUREMENT = "en_AU.UTF-8";
    LC_MONETARY = "en_AU.UTF-8";
    LC_NAME = "en_AU.UTF-8";
    LC_NUMERIC = "en_AU.UTF-8";
    LC_PAPER = "en_AU.UTF-8";
    LC_TELEPHONE = "en_AU.UTF-8";
    LC_TIME = "en_AU.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "";
  };

  services.mpd = {
    enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.defaultUserShell = pkgs.zsh;
  
  users.users.jacob = {
    isNormalUser = true;
    description = "Jacob Roling";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    zsh
    stow
    starship
    firefox
    fzf
    spotify
    zoxide
    lsd
    neofetch
    ripgrep
    bottom
    gh
    qjackctl
    pavucontrol
    killall
    discord
    envsubst
    cliphist
    protonup-qt
    imagemagick
    ffmpeg
    libreoffice
    protontricks
    wget
    gnome.zenity
    p7zip
    unzip
    php
    composer
  ];

  programs.steam.enable = true;
  programs.zsh.enable = true;

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = ["FiraCode"]; })
  ];

  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
