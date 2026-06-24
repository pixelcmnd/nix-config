{inputs}: {
  nixos = {
  };
  home = {
    "pixel@ibuprofen" = import ./x86_64-linux/ibuprofen {inherit inputs;};
    "pixel@morphine" = import ./aarch64-darwin/morphine {inherit inputs;};
  };
}
