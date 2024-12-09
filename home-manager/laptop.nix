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
    outputs.homeManagerModules.hyprland
  ];
}