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
    inputs.nix-colors.homeManagerModules.default
    inputs.nur.hmModules.nur
    # inputs.chaotic.homeManagerModules.default
    # inputs.nixvim.homeManagerModules.nixvim
    # Custom Home Manager Modules
    # outputs.homeManagerModules.example
    # outputs.homeManagerModules.firefox
    # outputs.homeManagerModules.nvim
    outputs.homeManagerModules.zsh
    outputs.homeManagerModules.vscode
    outputs.homeManagerModules.gnome
    outputs.homeManagerModules.kitty
    outputs.homeManagerModules.git
    outputs.homeManagerModules.mangohud
  ];

  home.username = settings.username;
  home.homeDirectory = "/home/${settings.username}";

  xdg = {
    enable = true;
  };

  services.udiskie = {
    enable = true;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  # programs.plasma = {
  #   enable = true;
  # };

  # home.file."Pictures/Wallpapers".source = config.lib.file.mkOutOfStoreSymlink ../../../../Pictures/Wallpapers;

  # Cursor
  # home.pointerCursor = {
  #   gtk.enable = true;
  #   x11.enable = true;
  #   name = "macOS-BigSur-White";
  #   package = pkgs.apple-cursor;
  #   size = 24;
  # };

  # Allow Home Manager to manage itself
  programs.home-manager.enable = true;

  home-manager.backupFileExtension = 'backup';

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.
}
