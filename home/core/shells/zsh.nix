{pkgs, ...}: {
  programs.zsh.enable = true;

  programs.zsh.initContent = ''
    # Vi key bindings
    bindkey -v
    KEYTIMEOUT=1

    # Cursor shape: line in insert, block in normal
    function zle-keymap-select {
      if [[ $KEYMAP == vicmd ]]; then
        echo -ne '\e[2 q'
      else
        echo -ne '\e[6 q'
      fi
    }
    function zle-line-init {
      echo -ne '\e[6 q'
    }
    zle -N zle-keymap-select
    zle -N zle-line-init
  '';

  programs.zsh.plugins = [
    {
      name = "grc";
      src = "${pkgs.grc}/etc";
      file = "grc.zsh";
    }
  ];

  home.shell.enableZshIntegration = true;
  programs.zsh.autosuggestion.enable = true;
  programs.zsh.syntaxHighlighting.enable = true;
  programs.zsh.historySubstringSearch.enable = true;
}
