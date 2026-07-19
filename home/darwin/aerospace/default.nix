{...}: {
  programs.aerospace.enable = true;

  programs.aerospace.launchd.enable = true;

  imports = [
    ./settings.nix
    ./keybindings.nix
    ./window-rules.nix
  ];
}
