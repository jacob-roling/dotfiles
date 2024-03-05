{ pkgs, inputs, config, ...}:
let
  nix-colors-lib = inputs.nix-colors.lib.contrib { inherit pkgs; };
in
{
  gtk = {
    enable = true;
    theme.name = "${config.colorScheme.slug}";
    theme.package = nix-colors-lib.gtkThemeFromScheme {
      scheme = config.colorScheme;
    };
  };
}
