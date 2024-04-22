{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./packages/cli-utils.nix
    ./packages/gaming.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  nix = {
    # This will add each flake input as a registry
    # To make nix commands consistent with your flake
    registry = lib.mapAttrs (_: value: {flake = value;}) inputs;

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

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
  time.timeZone = "Australia/Adelaide";
  
  # Locale
  i18n.defaultLocale = "en_AU.UTF-8";
  
  # i18n.extraLocaleSettings = {
  #   LC_ADDRESS = "en_AU.UTF-8";
  #   LC_IDENTIFICATION = "en_AU.UTF-8";
  #   LC_MEASUREMENT = "en_AU.UTF-8";
  #   LC_MONETARY = "en_AU.UTF-8";
  #   LC_NAME = "en_AU.UTF-8";
  #   LC_NUMERIC = "en_AU.UTF-8";
  #   LC_PAPER = "en_AU.UTF-8";
  #   LC_TELEPHONE = "en_AU.UTF-8";
  #   LC_TIME = "en_AU.UTF-8";
  # };

  # Bluetoothhardware 
  hardware.bluetooth.enable = true; # enables support for Bluetooth 
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  # USB
  services.udisks2.enable = true;

  # Sound
  sound.enable = true;
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

  # Fonts
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = ["FiraCode"]; })
  ];

  # Nix LD
  programs.nix-ld.enable = true;

  # Bash
  programs.bash.enable = true;
  programs.bash.enableCompletion = true;

  # OpenSSH
  services.openssh.enable = true;

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