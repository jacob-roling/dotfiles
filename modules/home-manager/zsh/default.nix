{ config, pkgs, input, ... }:
{
  environment.systemPackages = with pkgs; [
    zoxide
    lsd
    ripgrep
    bottom
    starship
  ];

  xdg.configFile."../.zshrc".source = ./.zshrc;
}
