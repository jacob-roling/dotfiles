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
    ./hardware-configurations/desktop.nix
    # Custom NixOS Modules
    # outputs.nixosModules.example
    outputs.nixosModules.AMDCPU
    outputs.nixosModules.nvidia
  ];

  home-manager = {
    extraSpecialArgs = {inherit inputs outputs settings;};
    users = {
      "${config.username}" = import ../home-manager/desktop.nix;
    };
  };
  
  networking.hostName = "nixos";
}