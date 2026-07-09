{...}: {
  imports = [
    ./shells
    #    ./editors
    ./terminals

    ./core.nix
    #./cache.nix
    # ./yazi.nix
    ./git.nix
    ./zellij.nix
  ];
}
