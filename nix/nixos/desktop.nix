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
  ];
  
  networking.hostName = "jacob-desktop-nixos";
}