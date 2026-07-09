{...}: {
  programs.zellij = {
    enable = true;
    settings = {
      theme = "gruvbox-dark";
      show_startup_tips = false;
    };
  };
}
