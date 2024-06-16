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
    ./common.nix
    ../hardware-configurations/laptop/hardware-configuration.nix
    # inputs.nixos-hardware.nixosModules.common-cpu-amd
    # Custom NixOS Modules
    # outputs.nixosModules.example
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    extraSpecialArgs = {inherit inputs outputs settings;};
    users = {
      "${settings.username}" = import ../home-manager/laptop.nix;
    };
  };

  # Fingerprint Driver
  services.fprintd.enable = true;
  services.fprintd.tod.enable = true;
  
  networking.hostName = "nixos";
}
