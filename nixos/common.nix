{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  settings,
  ...
}: {
  imports = [
    inputs.nur.modules.nixos.default
    inputs.home-manager.nixosModules.default
    inputs.stylix.nixosModules.stylix
    ./packages/cli-utils.nix
    ./packages/stylix.nix
    ./packages/gaming.nix
    ./packages/media.nix
    ./packages/music.nix
    ./packages/vscode.nix
    # Custom NixOS Modules
    outputs.nixosModules.zsh
    outputs.nixosModules.chromium
  ];

  users.users."${settings.username}" = {
    isNormalUser = true;
    extraGroups = settings.extraGroups;
    openssh.authorizedKeys.keys = settings.authorizedKeys;

    # mkpasswd -m sha-512
    hashedPassword = settings.hashedPassword;
  };

  nixpkgs = {
    overlays = [
      inputs.chaotic.overlays.default
      # outputs.overlays.additions
      # outputs.overlays.modifications
      # outputs.overlays.unstable-packages
    ];

    config = {
      allowUnfree = true;
      allowBroken = true;
    };
  };

  nix = {
    # This will add each flake input as a registry
    # To make nix commands consistent with your flake
    # registry = (lib.mapAttrs (_: flake: {inherit flake;})) ((lib.filterAttrs (_: lib.isType "flake")) inputs);

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    # nixPath = ["/etc/nix/path"];

    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
      trusted-users = ["root" "${settings.username}"];
      substituters = [
        "https://nix-community.cachix.org/"
        "https://chaotic-nyx.cachix.org/"
        "https://hyprland.cachix.org"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "chaotic-nyx.cachix.org-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
      download-buffer-size = 100000000;
    };
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;
  # boot.kernelPackages = pkgs.linuxPackages_cachyos;
  # chaotic.scx.enable = true;
  # chaotic.scx.package = pkgs.scx.full;

  # boot.kernelPackages = pkgs.linuxPackages_zen;
  # boot.kernelPackages = pkgs.linuxPackages;

  # Networking
  # networking.wireless.networks = {
  #   "VX220-C1D7".psk = "32424A6F1EC81";
  #   "WiFi-C2BE".psk = "38661129";
  # };

  networking.networkmanager.enable = true;
  networking.networkmanager.dns = "none";

  # These options are unnecessary when managing DNS ourselves
  networking.useDHCP = false;
  networking.dhcpcd.enable = false;

  # Configure DNS servers manually (this example uses Cloudflare and Google DNS)
  # IPv6 DNS servers can be used here as well.
  networking.nameservers = [
    "1.1.1.1"
    "1.0.0.1"
    "8.8.8.8"
    "8.8.4.4"
  ];

  # networking.wireless = {
  #   enable = true;
  #   userControlled.enable = true;
  # };
  
  # services.resolved.enable = true;
  # networking.networkmanager.dns = "systemd-resolved";

  # Printer
  services.printing.enable = true;
  
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  # Time
  time.timeZone = settings.timezone;
  
  # Locale
  i18n.defaultLocale = settings.locale;
  i18n.extraLocaleSettings = {
    LANGUAGE = "en_AU.UTF-8";
    LC_ALL = "en_AU.UTF-8";
  };
  
  # Bluetooth hardware 
  hardware.bluetooth.enable = true; # enables support for Bluetooth 
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  # USB
  services.udisks2.enable = true;

  # Sound
  # sound.enable = true;
  security.rtkit.enable = true;
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;
  };

  # SSD FSTrim
  # services.fstrim.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Fonts
  fonts.packages = with pkgs; [
    settings.font.package
    inter
  ];

  # Nix LD
  programs.nix-ld.enable = true;

  # NH
  programs.nh = {
    enable = true;
    clean = {
      enable = true;
    };
  };

  # OpenSSH
  services.openssh = {
    enable = true;
    # require public key authentication for better security
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;
    # settings.PermitRootLogin = "yes";
  };

  environment.sessionVariables = {
    FLAKE = settings.dotfiles-directory;
  };

  environment.systemPackages = with pkgs; [
    wpa_supplicant_gui
  ];

  # Keyboard
  services.xserver.xkb = {
    layout = "us";
    # Bind Ctrl to Caps Lock
    options = "ctrl:nocaps";
  };

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.11"; # Did you read the comment?
}
