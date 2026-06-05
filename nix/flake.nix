{
  description = "Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs_neofetch.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, unstable, nixpkgs_neofetch, flake-utils, home-manager, ... }:
  flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs { inherit system; };
      unstablePkgs = import unstable { inherit system; };
      pkgs_neofetch = import nixpkgs_neofetch { inherit system; };
    in {
      legacyPackages = {
        homeConfigurations = {
          "marcos" = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;

            # Specify your home configuration modules here, for example,
            # the path to your home.nix.
            modules = [ ./home.nix ];

            extraSpecialArgs = {
              inherit unstablePkgs pkgs_neofetch;
            };
          };
        };
      };
    }
  );
}
