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
    ../hardware-configurations/laptop.nix
    inputs.nixos-hardware.nixosModules.framework-12th-gen-intel
    # Custom NixOS Modules
    # outputs.nixosModules.example
  ];

  home-manager = {
    extraSpecialArgs = {inherit inputs outputs settings;};
    users = {
      "${settings.username}" = import ../home-manager/laptop.nix;
    };
  };

  networking.hostName = "nixos-laptop";
}
