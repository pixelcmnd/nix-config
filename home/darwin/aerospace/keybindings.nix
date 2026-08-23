{...}: {
  programs.aerospace.settings.mode = {
    main = {
      binding = {
        # See: https://nikitabobko.github.io/AeroSpace/commands#layout
        ctrl-shift-slash = "layout tiles horizontal vertical";
        ctrl-shift-comma = "layout accordion horizontal vertical";
        ctrl-shift-v = "layout floating tiling";
        ctrl-shift-f = "fullscreen";

        # See: https://nikitabobko.github.io/AeroSpace/commands#focus
        ctrl-cmd-h = "focus left";
        ctrl-cmd-j = "focus down";
        ctrl-cmd-k = "focus up";
        ctrl-cmd-l = "focus right";
        ctrl-alt-cmd-h = "focus-monitor left";
        ctrl-alt-cmd-l = "focus-monitor right";

        # See: https://nikitabobko.github.io/AeroSpace/commands#move
        ctrl-shift-h = "move left";
        ctrl-shift-j = "move down";
        ctrl-shift-k = "move up";
        ctrl-shift-l = "move right";

        # See: https://nikitabobko.github.io/AeroSpace/commands#resize
        ctrl-minus = "resize smart -50";
        ctrl-equal = "resize smart +50";

        # See: https://nikitabobko.github.io/AeroSpace/commands#workspace
        ctrl-alt-1 = "workspace 1";
        ctrl-alt-2 = "workspace 2";
        ctrl-alt-3 = "workspace 3";
        ctrl-alt-4 = "workspace 4";
        ctrl-alt-5 = "workspace 5";
        ctrl-alt-6 = "workspace 6";
        ctrl-alt-7 = "workspace 7";
        ctrl-alt-8 = "workspace 8";
        ctrl-alt-9 = "workspace 9";

        # See: https://nikitabobko.github.io/AeroSpace/commands#move-node-to-workspace
        ctrl-shift-1 = "move-node-to-workspace 1";
        ctrl-shift-2 = "move-node-to-workspace 2";
        ctrl-shift-3 = "move-node-to-workspace 3";
        ctrl-shift-4 = "move-node-to-workspace 4";
        ctrl-shift-5 = "move-node-to-workspace 5";
        ctrl-shift-6 = "move-node-to-workspace 6";
        ctrl-shift-7 = "move-node-to-workspace 7";
        ctrl-shift-8 = "move-node-to-workspace 8";
        ctrl-shift-9 = "move-node-to-workspace 9";

        # See: https://nikitabobko.github.io/AeroSpace/commands#workspace-back-and-forth
        alt-tab = "workspace-back-and-forth";
        # See: https://nikitabobko.github.io/AeroSpace/commands#move-workspace-to-monitor
        alt-shift-tab = "move-workspace-to-monitor --wrap-around next";

        # See: https://nikitabobko.github.io/AeroSpace/commands#mode
        alt-shift-semicolon = "mode service";
      };
    };
    service = {
      binding = {
        esc = ["reload-config" "mode main"];
        r = ["flatten-workspace-tree" "mode main"]; # reset layout
        backspace = ["close-all-windows-but-current" "mode main"];

        ctrl-cmd-h = ["join-with left" "mode main"];
        ctrl-cmd-j = ["join-with down" "mode main"];
        ctrl-cmd-k = ["join-with up" "mode main"];
        ctrl-cmd-l = ["join-with right" "mode main"];
      };
    };
  };
}
