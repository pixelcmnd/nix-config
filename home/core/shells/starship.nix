_: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;

    settings = {
      add_newline = true;
      format = "[#](bold blue) $username[@](white) $hostname[in](white) $directory$git_branch$git_status$python$time$status$line_break$character";

      username = {
        show_always = true;
        style_user = "cyan";
        style_root = "black bg:yellow";
        format = "[$user]($style) ";
      };
      hostname = {
        ssh_only = false;
        style = "green";
        format = "[$hostname]($style) ";
      };
      directory = {
        truncation_length = 0;
        truncate_to_repo = false;
        style = "bold yellow";
        format = "[$path]($style)[$read_only]($read_only_style)";
      };
      git_branch = {
        format = " on [git:](blue)[$branch]($style)";
        style = "cyan";
      };
      git_status = {
        format = "([ $all_status$ahead_behind]($style))";
        style = "red";
      };
      python = {
        format = "( [$virtualenv](green))";
      };
      time = {
        disabled = false;
        time_format = "%T";
        format = " [\\[$time\\]]($style)";
        style = "white";
      };
      status = {
        disabled = false;
        format = " [C:$status]($style)";
        style = "red";
      };
      character = {
        success_symbol = "[\\$](bold red)";
        error_symbol = "[\\$](bold red)";
        vimcmd_symbol = "[:](bold green)";
      };
    };
  };
}
