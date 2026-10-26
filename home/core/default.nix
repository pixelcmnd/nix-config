{...}: {
  imports = [
    ./shells
    ./terminals

    ./core.nix
    ./dev.nix
    ./eza.nix
    ./git.nix
    ./neovim
    ./zellij.nix
    ./vscode.nix
  ];
}
