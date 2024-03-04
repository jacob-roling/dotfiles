{ inputs, config, pkgs, ... }:
let
  nix-colors-lib = inputs.nix-colors.lib.contrib { inherit pkgs; };
in
{
  imports = [
    inputs.nix-colors.homeManagerModules.default
    ../../modules/home-manager/xdg.nix
    ../../modules/home-manager/git.nix
    ../../modules/home-manager/lf.nix
  ];

  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;

  gtk = {
    enable = true;
    theme.name = "${config.colorScheme.slug}";
    theme.package = nix-colors-lib.gtkThemeFromScheme {
      scheme = config.colorScheme;
    };
  };

  programs.bat = {
    enable = true;
    # themes = {
    #   "${config.colorScheme.slug}" = config.colorScheme;
    # };
  };

  programs.kitty = {
    enable = true;
    settings = with config.colorScheme.palette; {
      font_family = "FiraCode Nerd Font";
      font_size = "16.0";
      background = "#${base00}";
      foreground = "#${base05}";
      selection_foreground = "none";
      selection_background = "#${base02}";
      background_opacity = "0.5";
      color0 = "#${base00}";
      color8 = "#${base01}";
      color1 = "#${base0F}";
      color9 = "#${base0F}";
      color2 = "#${base0B}";
      color10 = "#${base0B}";
      color3 = "#${base0A}";
      color11 = "#${base0A}";
      color4 = "#${base0D}";
      color12 = "#${base0D}";
      color5 = "#${base0E}";
      color13 = "#${base0E}";
      color6 = "#${base0C}";
      color14 = "#${base0C}";
      color7 = "#${base05}";
      color15 = "#${base06}";
    };
  };

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "jacob";
  home.homeDirectory = "/home/jacob";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];



  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/jacob/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  
}
