{
  description = "NixOS Configuration";
  
  inputs = let
    nixpkgs-version = "23.11";
  in {
    # In general, install packages from a release, not from master.
    # If there's a need, you can install a specific package from nixpkgs-unstable.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-${nixpkgs-version}";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # home-manager release must be the same as the nixpkgs used in home-manager.
    home-manager.url = "github:nix-community/home-manager/release-${nixpkgs-version}";
    # You can change this to "nixpkgs-unstable" to use latest home-manager.
    # Then you also have to change nixpkgs to nixpkgs-unstable in homeConfigurations below.
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # hardware.url = "github:nixos/nixos-hardware";

    # Nix User Repository
    nur.url = "github:nix-community/NUR";

    # Nixvim
    nixvim = {
      url = "github:nix-community/nixvim/nixos-${nixpkgs-version}";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
    lib = nixpkgs.lib;
    forAllSystems = lib.genAttrs [
      "aarch64-linux"
      "i686-linux"
      "x86_64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];
  in rec {
    inherit nixpkgs;
    inherit nixpkgs-unstable;

    settings = import ./settings.nix {inherit pkgs;};

    # Your custom packages
    # Acessible through 'nix build', 'nix shell', etc
    mypkgs = forAllSystems (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in
        import ./nix/pkgs {inherit pkgs;}
    );

    # Devshell for bootstrapping
    # Acessible through 'nix develop' or 'nix-shell' (legacy)
    devShells = forAllSystems (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in
        import ./nix/shell.nix {inherit pkgs;}
    );

    # Your custom packages and modifications, exported as overlays
    overlays = import ./nix/overlays {inherit inputs;};

    # Reusable nixos modules you might want to export
    # These are usually stuff you would upstream into nixpkgs
    nixosModules = import ./nix/modules/nixos;
    
    # Reusable home-manager modules you might want to export
    # These are usually stuff you would upstream into home-manager
    homeManagerModules = import ./nix/modules/home-manager;

    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild switch --flake .#hostname'
    nixosConfigurations = {
      desktop = lib.nixosSystem {
        specialArgs = {inherit inputs outputs settings;};
        modules = [
          ./nix/nixos/desktop.nix
        ];
      };

      laptop = lib.nixosSystem {
        specialArgs = {inherit inputs outputs settings;};
        modules = [
          ./nix/nixos/laptop.nix
        ];
      };
    };

    # Standalone home-manager configuration entrypoint
    # Available through 'home-manager switch --flake .#user@host'

    # homeConfigurations = {
    #   "jacob@nixos" = home-manager.lib.homeManagerConfiguration {
    #     pkgs = nixpkgs.legacyPackages.${system};
    #     extraSpecialArgs = {inherit inputs outputs;};
    #     modules = [
    #       ./nix/home-manager/home.nix
    #     ];
    #   };
    # };
  };
}