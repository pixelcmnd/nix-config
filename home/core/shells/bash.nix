{
  lib,
  pkgs,
  ...
}: {
  programs.bash = {
    enable = true;
    initExtra = lib.mkBefore ''
      case $- in
        *i*) exec ${pkgs.nushell}/bin/nu ;;
      esac
    '';
  };
}
