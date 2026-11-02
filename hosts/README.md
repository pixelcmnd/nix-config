# Hosts

`hosts/default.nix` collects host configurations for `flake.nix`. Its `nix-darwin`, `nixos`, and `home` attributes become `darwinConfigurations`, `nixosConfigurations`, and `homeConfigurations` respectively. Only `darwinConfigurations."pixel@morphine"` is currently populated.

`aarch64-darwin/morphine` contains:

- `vars.nix` sets the platform and host name.
- `default.nix` combines those values with the repository's `vars.nix`, constructs a nix-darwin system, and passes `inputs` and `myvars` to system and Home Manager modules.
- `home.nix` selects Home Manager imports and sets the username, home directory, and Home Manager state version.

## Adding another macOS host

1. Create `hosts/<platform>/<host>/` with `default.nix`, `home.nix`, and `vars.nix`. Use `aarch64-darwin/morphine` as a starting point, then set `platform` and `hostName` for the new machine. The directory name is an organizational convention; the platform value selects the package set. `hostName` is a variable and does not set the macOS networking name; configure that separately if needed.
2. Review the shared identity in the root `vars.nix`. Host variables are merged over shared variables (`sharedVars // hostVars`), so host-specific values can override them. Adjust the user, home directory, system settings, and Home Manager imports for the new machine. In particular, review Touch ID, unfree packages, and the optional desktop extras in the example.
3. Choose the appropriate `system.stateVersion` and `home.stateVersion` for the new installation. These preserve compatibility with existing state; do not raise them routinely when updating Nix inputs.
4. Register the host in `hosts/default.nix`, under `nix-darwin`, for example:

   ```nix
   "user@new-host" = import ./aarch64-darwin/new-host {inherit self inputs;};
   ```

   The quoted attribute name is the flake output selector; it does not set the machine's hostname.
5. Ensure new Nix files are visible to the Git-backed flake (new files must be added to the Git index before Nix can see them). Evaluate or build the selected configuration before applying it, for example `nix build '.#darwinConfigurations."user@new-host".system'`. Once reviewed, activate it on the intended machine with the installed nix-darwin tooling, selecting the same flake output.

For a NixOS host, create a NixOS system with `nixpkgs.lib.nixosSystem`, supply that machine's hardware, boot, filesystem, networking, user, and Home Manager configuration, and register it under `nixos`. The repository has no NixOS host template, so the Darwin example needs substantial changes for Linux. The `home` attribute also has no standalone Home Manager example.
