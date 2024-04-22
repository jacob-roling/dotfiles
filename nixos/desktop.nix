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
    # inputs.nixos-hardware.nixosModules.common-cpu-amd
    # Custom NixOS Modules
    # outputs.nixosModules.example
    outputs.nixosModules.nvidia
  ];

  home-manager = {
    extraSpecialArgs = {inherit inputs outputs settings;};
    users = {
      "${settings.username}" = import ../home-manager/desktop.nix;
    };
  };
  
  networking.hostName = "nixos";
}