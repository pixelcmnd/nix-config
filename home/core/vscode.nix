{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    profiles.default = {
      enableExtensionUpdateCheck = false;
      enableUpdateCheck = false;
      extensions = with pkgs.vscode-extensions; [
        asvetliakov.vscode-neovim
        fill-labs.dependi
        gruntfuggly.todo-tree
        jdinhlife.gruvbox
        ms-python.debugpy
        ms-python.python
        ms-python.vscode-pylance
        nimlang.nimlang
        redhat.java
        rust-lang.rust-analyzer
        streetsidesoftware.code-spell-checker
        tamasfe.even-better-toml
        vadimcn.vscode-lldb
        vscjava.vscode-java-debug
        vscodevim.vim
      ];
      userSettings = {
        "workbench.colorTheme" = "Gruvbox Dark Medium";
        "rust-analyzer.check.command" = "clippy";
        "[rust]" = {
          "editor.defaultFormatter" = "rust-lang.rust-analyzer";
          "editor.formatOnSave" = true;
        };
        "editor.cursorBlinking" = "solid";
        "editor.cursorStyle" = "block";
        "editor.formatOnSave" = true;
        "editor.formatOnPaste" = true;
        "workbench.preferredDarkColorTheme" = "Gruvbox Dark Medium";
        "workbench.preferredHighContrastColorTheme" = "Gruvbox Dark Hard";
        "workbench.preferredHighContrastLightColorTheme" = "Gruvbox Light Hard";
        "workbench.preferredLightColorTheme" = "Gruvbox Light Medium";
        "editor.fontSize" = 14;
        "editor.fontFamily" = "JetBrainsMono NF, Menlo, Monaco, 'Courier New', monospace";
        "workbench.startupEditor" = "none";
        "cSpell.enabled" = true;
        "cSpell.language" = "en,ru";
        "extensions.experimental.affinity"."asvetliakov.vscode-neovim" = 1;
        "nim.lintOnSave" = true;
        "nim.formatOnSave" = true;
      };
    };
  };
}
