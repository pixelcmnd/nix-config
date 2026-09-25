{
  self,
  inputs,
  ...
}: let
  sharedVars = import ../../../vars.nix;
  hostVars = import ./vars.nix;
  myvars = sharedVars // hostVars;
  pkgs = inputs.nixpkgs.legacyPackages.${myvars.platform};
in
  inputs.nix-darwin.lib.darwinSystem {
    system = myvars.platform;
    specialArgs = {inherit inputs myvars;};
    modules = [
      inputs.home-manager.darwinModules.home-manager
      {
        nixpkgs.config.allowUnfree = true;
        nix.settings.experimental-features = "nix-command flakes";

        # Set Git commit hash for darwin-version.
        system.configurationRevision = self.rev or self.dirtyRev or null;

        system.stateVersion = 6;
        system.primaryUser = myvars.username;
        users.users.${myvars.username}.home = "/Users/${myvars.username}";

        fonts.packages = [pkgs.nerd-fonts.jetbrains-mono];

        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = {inherit inputs myvars;};
        home-manager.users.${myvars.username} = import ./home.nix;
      }
    ];
  }
