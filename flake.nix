{
  description = "Morphine NixOS Flake";

  # inputs: external flakes this flake depends on
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # Flake ooutputs
  outputs = {...} @ inputs: let
    hosts = import ./hosts {inherit inputs;};
  in {
    nixosConfigurations = hosts.nixos;
    homeConfigurations = hosts.home;
  };
}
