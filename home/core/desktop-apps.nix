{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs;
    [
      audacity
      keepassxc
      obsidian
      wireshark
      qbittorrent
    ]
    # Calibre is marked broken on Darwin in the pinned nixpkgs revision.
    ++ lib.optionals (!stdenv.hostPlatform.isDarwin) [calibre]
    # These binary packages do not support aarch64-linux.
    ++ lib.optionals (stdenv.hostPlatform.system == "x86_64-linux" || stdenv.hostPlatform.system == "aarch64-darwin") [
      discord
      upscayl
    ];
}
