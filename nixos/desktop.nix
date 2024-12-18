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
    ../hardware-configurations/desktop/hardware-configuration.nix
    inputs.nixos-hardware.nixosModules.common-cpu-amd
    # Custom NixOS Modules
    outputs.nixosModules.nvidia
    # outputs.nixosModules.hyprland
    outputs.nixosModules.gnome
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    # sharedModules = [ inputs.plasma-manager.homeManagerModules.plasma-manager ];

    extraSpecialArgs = {inherit inputs outputs settings;};
    users = {
      "${settings.username}" = import ../home-manager/desktop.nix;
    };

    backupFileExtension = "backup";
  };
  
  networking.hostName = "desktop";
}