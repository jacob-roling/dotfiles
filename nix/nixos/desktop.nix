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
    ./hardware-configurations/desktop.nix
    # Custom NixOS Modules
    # outputs.nixosModules.example
    outputs.nixosModules.AMDCPU
  ];
  
  networking.hostName = "${config.username}-desktop-nixos";
}