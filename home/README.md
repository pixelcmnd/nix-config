# Home Manager modules

Hosts choose their Home Manager imports in their own `home.nix`. The current Darwin host imports [`core`](core/), [`darwin`](darwin/), and `core/desktop-extras.nix`. Importing a directory loads its `default.nix`.

`core` configures shared user programs; `darwin` adds macOS packages and environment settings. These modules receive `inputs` and `myvars` through the host's `home-manager.extraSpecialArgs`. The host also sets `home.username`, `home.homeDirectory`, and `home.stateVersion`.

To add a shared module, create it in `core` and add it to `core/default.nix` if every host importing core should receive it. For an optional module, import it from the relevant host instead. Put Darwin-only settings in `darwin` and register them in `darwin/default.nix`. Check package availability and platform-specific paths before sharing a module with a new platform.
