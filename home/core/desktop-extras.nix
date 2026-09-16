{pkgs, ...}: {
  home.packages = with pkgs; [
    # cli/tui tools
    p7zip-rar # New p7zip fork with additional codecs and improvements
    yt-dlp # Feature-rich command-line audio/video downloader
    exiftool # Tool to read, write and edit EXIF meta information
    mpv # General-purpose media player, fork of MPlayer and mplayer2
    aria2 # Lightweight, multi-protocol, multi-source, command-line download utility
    fastfetch # Actively maintained, feature-rich and performance oriented, neofetch like system information tool
  ];
}
