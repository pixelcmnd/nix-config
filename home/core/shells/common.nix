{
  config,
  lib,
  pkgs,
  ...
}: let
  shellPaths =
    lib.optionals pkgs.stdenv.hostPlatform.isDarwin ["/opt/homebrew/bin"]
    ++ [
      "${config.home.homeDirectory}/.volta/bin"
      "${config.home.homeDirectory}/.local/bin"
      "${config.home.homeDirectory}/.cargo/bin"
    ];

  sshAuthSock =
    if pkgs.stdenv.hostPlatform.isDarwin
    then "${config.home.homeDirectory}/Library/Containers/com.bitwarden.desktop/Data/.bitwarden-ssh-agent.sock"
    else "${config.home.homeDirectory}/.bitwarden-ssh-agent.sock";

  commonAliases = {
    # Common use
    cd = "z";
    ze = "zellij";
    q = "exit";
    tarnow = "tar -acf ";
    untar = "tar -zxvf ";
    wget = "wget -c ";
    t = "touch ";
    dfh = "df -h";
    free = "free -h";
    n = "nvim";
    jctl = "journalctl -p 3 -xb";

    # Git
    lg = "lazygit";
    g = "git";
    gs = "git status";
    ga = "git add";
    gc = "git commit";
    gp = "git push";
    gl = "git log --oneline --graph --decorate";

    # Nix
    ns = "nix search nixpkgs";
    nr = "nix run nixpkgs#";
    nd = "nix develop";
    nb = "nix build";
  };
in {
  home.sessionVariables.SSH_AUTH_SOCK = sshAuthSock;
  programs.nushell.environmentVariables.SSH_AUTH_SOCK = sshAuthSock;

  programs.zsh.initContent = lib.mkOrder 550 ''
    # Keep PATH unique when entering a nested shell.
    typeset -U path PATH
    path=(${lib.escapeShellArgs shellPaths} $path)
    export SSH_AUTH_SOCK=${lib.escapeShellArg sshAuthSock}
    ${lib.optionalString pkgs.stdenv.hostPlatform.isDarwin ''
      fpath=(/opt/homebrew/share/zsh/site-functions $fpath)
    ''}
  '';

  programs.nushell.extraEnv = ''
    $env.PATH = (${lib.hm.nushell.toNushell {} shellPaths} | append $env.PATH | uniq)
  '';

  programs.zsh.shellAliases = commonAliases;
  programs.nushell.shellAliases = commonAliases;
}
