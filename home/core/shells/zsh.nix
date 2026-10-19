{pkgs, ...}: {
  programs.zsh.enable = true;

  programs.zsh.initContent = ''
    # Vi key bindings
    bindkey -v
    KEYTIMEOUT=1

    # Ctrl-R enters vi command mode; from there it searches shell history.
    bindkey -M viins '^R' vi-cmd-mode
    bindkey -M vicmd '^R' history-incremental-search-backward
    bindkey -M vicmd 'k' up-line-or-history
    bindkey -M vicmd 'j' down-line-or-history

    # Accept the current autosuggestion from insert mode.
    bindkey -M viins '^N' autosuggest-accept

    # Enable Zsh history substitutions such as !! and !$; show expansions before running.
    setopt BANG_HIST HIST_VERIFY
    bindkey -M viins ' ' magic-space

    setopt AUTO_CD

    # Expand each additional dot into one more parent-directory segment.
    function expand-cd-parent-dot {
      local target remaining

      if [[ $LBUFFER == *'cd '* ]]; then
        target=''${LBUFFER##*cd }
      elif [[ -z $LBUFFER || $LBUFFER == . || $LBUFFER == .. || $LBUFFER == ../* ]]; then
        target=$LBUFFER
      else
        zle self-insert
        return
      fi

      if [[ -z $RBUFFER && ( -z $target || $target == . ) ]]; then
        LBUFFER+='.'
        return
      fi

      if [[ -z $RBUFFER && ( $target == .. || $target == ../* ) ]]; then
        remaining=$target
        while [[ $remaining == ../* ]]; do
          remaining=''${remaining#../}
        done
        if [[ $remaining == .. ]]; then
          LBUFFER+='/..'
          return
        fi
      fi

      zle self-insert
    }
    zle -N expand-cd-parent-dot
    bindkey -M viins '.' expand-cd-parent-dot

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
