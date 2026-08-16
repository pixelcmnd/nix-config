{...}: {
  programs.atuin.enable = true;
  programs.atuin.enableZshIntegration = true;
  programs.atuin.enableNushellIntegration = true;

  programs.atuin.settings = {
    keymap_mode = "vim-normal";
    auto_sync = true;
    theme.name = "autumn";
  };
}
