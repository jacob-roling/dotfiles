{
  description = "NixOS Configuration";
  
  inputs = {
    # In general, install packages from a release, not from master.
    # If there's a need, you can install a specific package from nixpkgs-unstable.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      # You can change this to "nixpkgs-unstable" to use latest home-manager.
      # Then you also have to change nixpkgs to nixpkgs-unstable in homeConfigurations below.
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nix User Repository
    nur.url = "github:nix-community/NUR";

    # NixOS Hardware Fixes
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # Nixvim
    nixvim = {
      url = "github:nix-community/nixvim/nixos-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nix Colors
    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
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
        settings = import ./settings.nix {inherit pkgs;};
      in nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs outputs settings;};
        modules = [
          ./nixos/desktop.nix
        ];
      };

      # laptop = let
      #   system = "x86_64-linux";
      #   pkgs = nixpkgs.legacyPackages.${system};
      #   settings = import ./settings.nix {inherit pkgs;};
      # in nixpkgs.lib.nixosSystem {
      #   specialArgs = {inherit inputs outputs settings;};
      #   modules = [
      #     ./nixos/laptop.nix
      #   ];
      # };
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