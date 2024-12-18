{
  description = "NixOS Configuration";
  
  inputs = {
    # In general, install packages from a release, not from master.
    # If there's a need, you can install a specific package from nixpkgs-unstable.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager/master";
      # You can change this to "nixpkgs-unstable" to use latest home-manager.
      # Then you also have to change nixpkgs to nixpkgs-unstable in homeConfigurations below.
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hyprland
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    # Stylix
    stylix.url = "github:danth/stylix";

    # Nix User Repository
    nur.url = "github:nix-community/NUR";

    # NixOS Hardware Fixes
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # Zen Browser
    zen-browser.url = "github:MarceColl/zen-browser-flake";

    # Chaotic
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    # Nixvim
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nix Colors
    nix-colors.url = "github:misterio77/nix-colors";

    # Nix VSCode Extensions
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";

    # KDE Plasma
    plasma-manager = {
      url = "github:pjones/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    # Themes
    themes = {
      url = "github:RGBCube/ThemeNix";
    };

    # Firefox Nightly
    firefox.url = "github:nix-community/flake-firefox-nightly";
    firefox.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    themes,
    ...
  }: let
    inherit (self) outputs;
  in {
    # Your custom packages
    # Acessible through 'nix build', 'nix shell', etc
    # mypkgs = forAllSystems (
    #   system: let
    #     pkgs = nixpkgs.legacyPackages.${system};
    #   in
    #     import ./nix/pkgs {inherit pkgs;}
    # );

    # Devshell for bootstrapping
    # Acessible through 'nix develop' or 'nix-shell' (legacy)
    # devShells = forAllSystems (
    #   system: let
    #     pkgs = nixpkgs.legacyPackages.${system};
    #   in
    #     import ./nix/shell.nix {inherit pkgs;}
    # );

    # Your custom packages and modifications, exported as overlays
    # overlays = import ./overlays {inherit inputs;};

    # Reusable nixos modules you might want to export
    # These are usually stuff you would upstream into nixpkgs
    nixosModules = import ./modules/nixos;
    
    # Reusable home-manager modules you might want to export
    # These are usually stuff you would upstream into home-manager
    homeManagerModules = import ./modules/home-manager;

    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild switch --flake .#hostname'
    nixosConfigurations = {
      desktop = let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
        settings = import ./settings.nix {inherit pkgs themes;};
      in nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs settings system;};
        modules = [
          ./nixos/desktop.nix
          inputs.chaotic.nixosModules.default
        ];
      };

      laptop = let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
        settings = import ./settings.nix {inherit pkgs themes;};
      in nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs settings system;};
        modules = [
          ./nixos/laptop.nix
        ];
      };
    };

    # Standalone home-manager configuration entrypoint
    # Available through 'home-manager switch --flake .#user@host'
    # homeConfigurations = {
    #   "user@host" = home-manager.lib.homeManagerConfiguration {
    #     pkgs = nixpkgs.legacyPackages.${system};
    #     extraSpecialArgs = {inherit inputs outputs;};
    #     modules = [
    #       ./nix/home-manager/home.nix
    #     ];
    #   };
    # };
  };
}
