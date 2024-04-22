{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./common.nix
    ./hardware-configurations/laptop.nix
    # Custom NixOS Modules
    # outputs.nixosModules.example
  ];

  home-manager = {
    extraSpecialArgs = {inherit inputs outputs;};
    users = {
      "${config.username}" = import ../home-manager/laptop.nix;
    };
  };

  networking.hostName = "nixos-laptop";
}
