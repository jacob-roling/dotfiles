# Add your reusable NixOS modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These should be stuff you would like to share with others, not your personal configurations.
{
  # List your module files here
  KDE = import ./KDE.nix;
  nvidia = import ./nvidia.nix;
  gnome = import ./gnome.nix;
  zsh = import ./zsh.nix;
  chromium = import ./chromium.nix;
  hyprland = import ./hyprland.nix;
}