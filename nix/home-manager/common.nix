{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    inputs.nix-colors.homeManagerModules.default
    inputs.nixvim.homeManagerModules.nixvim
    inputs.nur.hmModules.nur
  ];

  # home.file."Pictures/Wallpapers".source = config.lib.file.mkOutOfStoreSymlink ../../../../Pictures/Wallpapers;

  # Cursor
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = "macOS-BigSur-White";
    package = pkgs.apple-cursor;
    size = 24;
  };

  home = {
    username = "jacob";
    homeDirectory = "/home/jacob";
  };

  # Allow Home Manager to manage itself
  programs.home-manager.enable = true;
}