{
  description = "NixOS Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";

    # home-manager = {
    #   url = "github:nix-community/home-manager";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    hyprland = {
      url = "github:hyprwm/Hyprland";
    };

    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = { self, nixpkgs, ... } @inputs:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    nixosConfigurations = {
      # sudo nixos-rebuild switch --flake .#desktop
      desktop = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
        };

        modules = [
          ./hosts/desktop/configuration.nix
          # inputs.home-manager.nixosModules.default
        ];
      };



      # sudo nixos-rebuild switch --flake .#laptop
      # laptop = nixpkgs.lib.nixosSystem {
      #   specialArgs = {
      #     inherit inputs;
      #   };

      #   modules = [
      #     ./hosts/laptop/configuration.nix
      #     inputs.home-manager.nixosModules.default
      #   ];
      # };
    };
  };
}
