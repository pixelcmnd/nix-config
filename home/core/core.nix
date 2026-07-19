{pkgs, ...}: {
  # CLI / TUI tools
  home.packages = with pkgs; [
    curl # Command line tool for transferring files with URL syntax
    wget # Tool for retrieving files using HTTP, HTTPS, and FTP
    ripgrep # Utility that combines the usability of The Silver Searcher with the raw speed of grep
    fd # Simple, fast and user-friendly alternative to find
    jq # Lightweight and flexible command-line JSON processor
    imagemagick # Software suite to create, edit, compose, or convert bitmap images
    btop # Monitor of resources
    ffmpeg # Complete, cross-platform solution to record, convert and stream audio and video
    qman # A more modern man page viewer for our terminals
  ];

  # A modern replacement for ‘ls’
  # useful in fish/bash prompt, not in nushell.
  programs.lsd = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
  };

  # a cat(1) clone with syntax highlighting and Git integration.
  programs.bat = {
    enable = true;
    config = {
      pager = "less -FR";
    };
  };

  # A command-line fuzzy finder
  programs.fzf = {
    enable = true;
    historyWidget.command = "";
  };

  # very fast version of tldr in Rust
  programs.tealdeer = {
    enable = true;
    enableAutoUpdates = true;
    settings = {
      display = {
        compact = false;
        use_pager = true;
      };
      updates = {
        auto_update = true;
        auto_update_interval_hours = 720;
      };
    };
  };

  programs.man = {
    enable = true;
    generateCaches = true;
  };

  # zoxide is a smarter cd command, inspired by z and autojump.
  # It remembers which directories you use most frequently,
  # so you can "jump" to them in just a few keystrokes.
  # zoxide works on all major shells.
  #
  #   z foo              # cd into highest ranked directory matching foo
  #   z foo bar          # cd into highest ranked directory matching foo and bar
  #   z foo /            # cd into a subdirectory starting with foo
  #
  #   z ~/foo            # z also works like a regular cd command
  #   z foo/             # cd into relative path
  #   z ..               # cd one level up
  #   z -                # cd into previous directory
  #
  #   zi foo             # cd with interactive selection (using fzf)
  #
  #   z foo<SPACE><TAB>  # show interactive completions (zoxide v0.8.0+, bash 4.4+/fish/zsh only)
  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
  };

  # Atuin replaces your existing shell history with a SQLite database,
  # and records additional context for your commands.
  # Additionally, it provides optional and fully encrypted
  # synchronisation of your history between machines, via an Atuin server.
  programs.atuin = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
  };

  # Carapace, a multi-shell multi-command argument completer.
  programs.carapace = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
  };

  programs.home-manager.enable = true;
}
