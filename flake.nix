{
  description = "Morphine NixOS Flake";

  # inputs: external flakes this flake depends on
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixvim.url = "github:nix-community/nixvim";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # Flake ooutputs
  outputs = {self, ...} @ inputs: let
    hosts = import ./hosts {inherit self inputs;};
  in {
    nixosConfigurations = hosts.nixos;
    darwinConfigurations = hosts.nix-darwin;
    homeConfigurations = hosts.home;
  };
}
