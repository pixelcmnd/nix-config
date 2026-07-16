{...}: {
  programs.aerospace.enable = true;

  programs.aerospace.launchd.enable = true;
  programs.aerospace.settings = {
    # Config version for compatibility and deprecations
    # See: https://nikitabobko.github.io/AeroSpace/guide#config-version
    # Fallback value (if you omit the key): config-version = 1
    config-version = 2;
    start-at-login = true;
    # Automatically reload the config when the config file is saved
    # After setting this to true, reload once manually to start the auto-reloading
    auto-reload-config = true;

    # Normalizations. See: https://nikitabobko.github.io/AeroSpace/guide#normalization
    enable-normalization-flatten-containers = true;
    enable-normalization-opposite-orientation-for-nested-containers = true;

    # See: https://nikitabobko.github.io/AeroSpace/guide#layouts
    # The 'accordion-padding' specifies the size of accordion padding
    # You can set 0 to disable the padding feature
    accordion-padding = 30;
    default-root-container-layout = "tiles";
    default-root-container-orientation = "auto";

    # Mouse follows focus when focused monitor changes
    # Drop it from your config, if you don't like this behavior
    # See https://nikitabobko.github.io/AeroSpace/guide#on-focus-changed-callbacks
    # See https://nikitabobko.github.io/AeroSpace/commands#move-mouse
    # Fallback value (if you omit the key): on-focused-monitor-changed = []
    on-focused-monitor-changed = ["move-mouse monitor-lazy-center"];
    automatically-unhide-macos-hidden-apps = false;
    persistent-workspaces = ["1" "2" "3" "4" "5" "6" "7" "8" "9"];

    gaps = {
      outer = {
        bottom = 0;
        left = 0;
        right = 0;
        top = 0;
      };
    };
    mode = {
      main = {
        binding = {
          # See: https://nikitabobko.github.io/AeroSpace/commands#layout
          alt-cmd-slash = "layout tiles horizontal vertical";
          alt-cmd-comma = "layout accordion horizontal vertical";
          alt-cmd-v = "layout floating tiling";
          alt-cmd-f = "fullscreen";

          # See: https://nikitabobko.github.io/AeroSpace/commands#focus
          alt-cmd-h = "focus left";
          alt-cmd-j = "focus down";
          alt-cmd-k = "focus up";
          alt-cmd-l = "focus right";
          alt-shift-cmd-h = "focus-monitor left";
          alt-shift-cmd-l = "focus-monitor right";

          # See: https://nikitabobko.github.io/AeroSpace/commands#move
          alt-shift-h = "move left";
          alt-shift-j = "move down";
          alt-shift-k = "move up";
          alt-shift-l = "move right";

          # See: https://nikitabobko.github.io/AeroSpace/commands#resize
          alt-minus = "resize smart -50";
          alt-equal = "resize smart +50";

          # See: https://nikitabobko.github.io/AeroSpace/commands#workspace
          alt-1 = "workspace 1";
          alt-2 = "workspace 2";
          alt-3 = "workspace 3";
          alt-4 = "workspace 4";
          alt-5 = "workspace 5";
          alt-6 = "workspace 6";
          alt-7 = "workspace 7";
          alt-8 = "workspace 8";
          alt-9 = "workspace 9";

          # See: https://nikitabobko.github.io/AeroSpace/commands#move-node-to-workspace
          alt-shift-1 = "move-node-to-workspace 1";
          alt-shift-2 = "move-node-to-workspace 2";
          alt-shift-3 = "move-node-to-workspace 3";
          alt-shift-4 = "move-node-to-workspace 4";
          alt-shift-5 = "move-node-to-workspace 5";
          alt-shift-6 = "move-node-to-workspace 6";
          alt-shift-7 = "move-node-to-workspace 7";
          alt-shift-8 = "move-node-to-workspace 8";
          alt-shift-9 = "move-node-to-workspace 9";

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

          alt-shift-h = ["join-with left" "mode main"];
          alt-shift-j = ["join-with down" "mode main"];
          alt-shift-k = ["join-with up" "mode main"];
          alt-shift-l = ["join-with right" "mode main"];
        };
      };
    };
    on-window-detected = [
      {
        check-further-callbacks = true;
        "if" = {
          app-id = "com.apple.systempreferences";
          app-name-regex-substring = "settings";
          during-aerospace-startup = true;
          window-title-regex-substring = "substring";
          workspace = "workspace-name";
        };
        run = [
          "layout floating"
        ];
      }
      {
        check-further-callbacks = true;
        "if" = {
          app-id = "com.apple.finder";
        };
        run = [
          "layout floating"
        ];
      }
    ];
  };
}
