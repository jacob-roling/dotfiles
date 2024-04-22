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
  ];

  networking.hostName = "jacob-laptop-nixos";
}
