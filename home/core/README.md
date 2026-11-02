# Shared Home Manager configuration

`default.nix` imports the shared modules below. Changes here affect every host that imports `home/core`.

- `core.nix`: command-line utilities, shell integrations, and Home Manager itself.
- `dev.nix`: development tools and the user Nim configuration using Clang.
- `desktop-apps.nix`: desktop applications, with platform conditions for some packages.
- `git.nix`: Git identity from `myvars`, signing, aliases, and related tools. Its activation removes an existing `~/.gitconfig` before Home Manager checks link targets; review this behavior on a new host.
- `eza.nix`, `zellij.nix`, and `vscode.nix`: individual program settings.
- [`shells`](shells/), [`terminals`](terminals/), and [`neovim`](neovim/): grouped program configuration.

The current host imports the optional `desktop-extras.nix` separately. Add packages to the appropriate module and keep platform-specific choices conditional or in a platform module.
