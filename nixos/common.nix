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
    inputs.nur.nixosModules.nur
    inputs.home-manager.nixosModules.default
    ./packages/cli-utils.nix
    ./packages/gaming.nix
    ./packages/media.nix
    # Custom NixOS Modules
    # outputs.nixosModules.example
    outputs.nixosModules.git
    outputs.nixosModules.gnome
  ];

  programs.zsh.enable = true;

  users.users = {
    "${settings.username}" = {
      isNormalUser = true;
      extraGroups = settings.extraGroups;
      shell = pkgs.zsh;
      # openssh.authorizedKeys.keys = [
      #   "ssh-rsa AAAAB3NzaC reinis@home-desktop-debian"
      #   "ssh-rsa AAAAB3NzaC1yc2EA reinis@home-desktop-nixos"
      # ];

      # mkpasswd -m sha-512
      hashedPassword = settings.hashedPassword;
    };
  };

  nixpkgs = {
    overlays = [
      # outputs.overlays.additions
      # outputs.overlays.modifications
      # outputs.overlays.unstable-packages
    ];

    config = {
      allowUnfree = true;
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
    };
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.networkmanager.enable = true;

  # Printer
  services.printing.enable = true;

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
  sound.enable = true;
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
  ];

  # Nix LD
  programs.nix-ld.enable = true;

  # OpenSSH
  services.openssh.enable = true;

  environment.sessionVariables = {
    FLAKE = settings.dotfiles-directory;
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
