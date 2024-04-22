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
    outputs.nixosModules.nvidia
  ];
  
  networking.hostName = "${config.username}-desktop-nixos";
}