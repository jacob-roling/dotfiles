# Add your reusable home-manager modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These should be stuff you would like to share with others, not your personal configurations.
{
  # List your module files here
  # my-module = import ./my-module.nix;
  zsh = import ./zsh.nix;
  nvim = import ./nvim;
  firefox = import ./firefox.nix;
  vscode = import ./vscode.nix;
  gnome = import ./gnome.nix;
  kitty = import ./kitty.nix;
  git = import ./git.nix;
  mangohud = import ./mangohud.nix;
  hyprland = import ./hyprland.nix;
  yazi = import ./yazi.nix;
  bat = import ./bat.nix;
  tmux = import ./tmux.nix;
}
