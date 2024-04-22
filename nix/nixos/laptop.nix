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

  networking.hostName = "${config.username}-laptop-nixos";
}
