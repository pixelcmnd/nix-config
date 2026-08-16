{pkgs, ...}: {
  home.packages = with pkgs; [
    mole-cleaner # CLI tool for cleaning and optimizing macOS systems
  ];
}
