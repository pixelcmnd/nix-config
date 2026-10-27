{...}: {
  imports = [
    ./shells
    ./terminals

    ./core.nix
    ./desktop-apps.nix
    ./dev.nix
    ./eza.nix
    ./git.nix
    ./neovim
    ./zellij.nix
    ./vscode.nix
  ];
}
