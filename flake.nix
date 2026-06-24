{
  description = "Morphine NixOS Flake";

  # inputs: external flakes this flake depends on
  inputs = {
    flake-schemas.url = "https://flakehub.com/f/DeterminateSystems/flake-schemas/*";

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri-flake = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia-shell = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    determinate = {
      url = "github:DeterminateSystems/determinate";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # Flake ooutputs
  outputs = {...} @ inputs: 
  let
    hosts = import ./hosts {inherit inputs;};
  in {
    # Schemas tell Nix about the structure of your flake's outputs
    schemas = inputs.flake-schemas.schemas;
    nixosConfigurations = hosts.nixos;
    homeConfigurations  = hosts.home;
  };
}
