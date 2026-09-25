{...}: {
  programs.alacritty = {
    enable = true;

    settings = {
      window = {
        decorations = "Buttonless";
        padding = {
          x = 5;
          y = 5;
        };
        dynamic_padding = true;
        opacity = 0.85;
        blur = true;
        option_as_alt = "Both";
      };

      font = {
        size = 14;

        normal = {
          family = "JetBrainsMono NF";
          style = "Regular";
        };

        bold = {
          family = "JetBrainsMono NF";
          style = "Bold";
        };

        italic = {
          family = "JetBrainsMono NF";
          style = "italic";
        };
      };

      selection.save_to_clipboard = true;

      cursor.style = {
        shape = "Block";
        blinking = "On";
      };

      colors = {
        transparent_background_colors = true;

        primary = {
          foreground = "#EBDBB2";
          background = "#1D2021";
        };

        cursor = {
          text = "#1D2021";
          cursor = "#EBDBB2";
        };

        normal = {
          black = "#1D2021";
          red = "#CC241D";
          green = "#98971A";
          yellow = "#D79921";
          blue = "#458588";
          magenta = "#B16286";
          cyan = "#689D6A";
          white = "#A89984";
        };

        bright = {
          black = "#928374";
          red = "#FB4934";
          green = "#B8BB26";
          yellow = "#FABD2F";
          blue = "#83A598";
          magenta = "#D3869B";
          cyan = "#8EC07C";
          white = "#EBDBB2";
        };

        selection = {
          text = "#EBDBB2";
          background = "#665C54";
        };
      };
    };
  };
}
