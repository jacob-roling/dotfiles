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
    ./hardware-configurations/laptop.nix
    # Custom NixOS Modules
    # outputs.nixosModules.example
  ];

  home-manager = {
    extraSpecialArgs = {inherit inputs outputs settings;};
    users = {
      "${config.username}" = import ../home-manager/laptop.nix;
    };
  };

  networking.hostName = "nixos-laptop";
}
