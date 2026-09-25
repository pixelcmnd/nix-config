{
  self,
  inputs,
}: {
  nixos = {
  };
  nix-darwin = {
    "pixel@morphine" = import ./aarch64-darwin/morphine {inherit self inputs;};
  };
  home = {
  };
}
