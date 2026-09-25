{inputs}: {
  nixos = {
  };
  home = {
    "pixel@morphine" = import ./aarch64-darwin/morphine {inherit inputs;};
  };
}
