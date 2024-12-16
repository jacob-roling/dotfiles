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
    inputs.nur.modules.homeManager.default
    inputs.nixvim.homeManagerModules.nixvim
    # inputs.chaotic.homeManagerModules.default
    # inputs.nixvim.homeManagerModules.nixvim
    # Custom Home Manager Modules
    # outputs.homeManagerModules.vscode
    outputs.homeManagerModules.zsh
    outputs.homeManagerModules.kitty
    outputs.homeManagerModules.git
    outputs.homeManagerModules.nvim
    outputs.homeManagerModules.mangohud
    outputs.homeManagerModules.yazi
  ];

  home.username = settings.username;
  home.homeDirectory = "/home/${settings.username}";

  xdg = {
    enable = true;
  };

  services.udiskie = {
    enable = true;
  };

  programs = {
    home-manager.enable = true;

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.
}
