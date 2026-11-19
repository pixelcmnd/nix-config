{ pkgs, inputs, ... }:

{
  imports = [
    inputs.nix-extras.homeModules.rift
  ];

  programs.rift = {
    enable = true;

    package = inputs.nix-extras.packages.${pkgs.stdenv.hostPlatform.system}.rift-wm;

    launchd.enable = true;

    settings = {
      settings = {
        hot_reload = true;
        default_disable = false;
        animate = true;
        animation_duration = 0.2;
        focus_follows_mouse = false;

        # run_on_start = [
        #   "${pkgs.jankyborders}/bin/borders width=8.0 hidpi=on active_color=0xffff453a"
        # ];

        layout = {
          mode = "traditional";
          window_insertion_point = "end_of_tree";

          gaps = {
            outer = {
              top = 6;
              bottom = 6;
              left = 6;
              right = 6;
            };
            inner = {
              horizontal = 6;
              vertical = 6;
            };
          };
        };

        drag_drop.modifier = "Alt + Cmd";

        gestures = {
          enabled = true;
          fingers = 4;
          skip_empty = true;
        };

        ui = {
          menu_bar = {
            enabled = true;
            display_style = "label";
            show_fullscreen_indicator = true;
          };

          mission_control = {
            enabled = true;
            fade_enabled = true;
          };
        };
      };

      virtual_workspaces = {
        default_workspace_count = 9;
        workspace_names = [
          "1"
          "2"
          "3"
          "4"
          "5"
          "6"
          "7"
          "8"
          "9"
        ];
        mode = "per_display";

        app_rules = [
          {
            app_id = "com.apple.systempreferences";
            floating = true;
            focus = false;
          }
          {
            app_id = "com.apple.finder";
            floating = true;
            focus = false;
          }
          {
            app_id = "com.apple.ScreenContinuity";
            floating = true;
            focus = false;
          }
          {
            app_id = "com.apple.calculator";
            floating = false;
            focus = false;
            manage = false;
          }
          {
            app_id = "com.bitwarden.desktop";
            floating = false;
            focus = false;
            manage = false;
          }
          {
            app_id = "com.linguangming.shadowrocket";
            floating = true;
            focus = false;
          }
          {
            app_id = "io.ente.auth.mac";
            floating = true;
            focus = false;
          }
          {
            app_name = "neovide";
            floating = true;
            focus = false;
          }
          {
            app_id = "app.zen-browser.zen";
            floating = false;
            focus = false;
            workspace = 0;
          }
          {
            app_id = "org.whispersystems.signal-desktop";
            floating = false;
            focus = false;
            workspace = 4;
          }
          {
            app_id = "ru.keepcoder.Telegram";
            floating = false;
            focus = false;
            workspace = 4;
          }
          {
            app_id = "com.apple.mail";
            floating = false;
            focus = false;
            workspace = 5;
          }
          {
            app_id = "com.hnc.Discord";
            floating = false;
            focus = false;
            workspace = 5;
          }
          {
            app_id = "com.hnc.DiscordCanary";
            floating = false;
            focus = false;
            workspace = 5;
          }
          {
            app_id = "com.happ.www";
            floating = true;
            focus = false;
          }
          {
            app_id = "com.liguangming.Shadowrocket";
            floating = true;
            focus = false;
          }
          {
            app_id = "ru.yandex.desktop.music";
            floating = false;
            focus = false;
            workspace = 8;
          }
          {
            app_id = "net.smetonis.lightning";
            floating = false;
            focus = false;
            workspace = 5;
          }
          {
            app_id = "com.yourcompany.AmneziaVPN";
            floating = true;
            focus = false;
          }
          {
            app_id = "org.amnezia.awg";
            floating = true;
            focus = false;
          }
        ];
      };

      modifier_combinations = {
        focus = "Ctrl + Cmd";
        move = "Ctrl + Shift";
        workspace = "Ctrl + Alt";
        display_focus = "Ctrl + Alt + Cmd";
        display_window_move = "Ctrl + Alt + Shift";
        display_workspace_move = "Alt + Shift + Meta";
      };

      keys = {
        "Alt + Z" = "toggle_space_activated";

        # Focus
        "focus + H" = {
          move_focus = "left";
        };
        "focus + J" = {
          move_focus = "down";
        };
        "focus + K" = {
          move_focus = "up";
        };
        "focus + L" = {
          move_focus = "right";
        };
        "workspace + F" = "toggle_focus_floating";

        # Movement
        "move + H" = {
          move_node = "left";
        };
        "move + J" = {
          move_node = "down";
        };
        "move + K" = {
          move_node = "up";
        };
        "move + L" = {
          move_node = "right";
        };

        # Layout
        "move + Slash" = "toggle_orientation";
        "move + Comma" = "toggle_stack";
        "move + B" = "balance";
        "focus + U" = "ascend";
        "focus + I" = "descend";

        # Resize and state
        "move + Minus" = {
          resize_window_shrink = "smart";
        };
        "move + Equal" = {
          resize_window_grow = "smart";
        };
        "workspace + R" = {
          binding_mode = "resize";
        };
        "move + Space" = "toggle_window_floating";
        "move + F" = "toggle_fullscreen";

        # Workspace navigation
        "workspace + 1" = {
          switch_to_workspace = 0;
        };
        "workspace + 2" = {
          switch_to_workspace = 1;
        };
        "workspace + 3" = {
          switch_to_workspace = 2;
        };
        "workspace + 4" = {
          switch_to_workspace = 3;
        };
        "workspace + 5" = {
          switch_to_workspace = 4;
        };
        "workspace + 6" = {
          switch_to_workspace = 5;
        };
        "workspace + 7" = {
          switch_to_workspace = 6;
        };
        "workspace + 8" = {
          switch_to_workspace = 7;
        };
        "workspace + 9" = {
          switch_to_workspace = 8;
        };

        "workspace + J" = {
          next_workspace = false;
        };
        "workspace + K" = {
          prev_workspace = false;
        };
        "Alt + Tab" = "switch_to_last_workspace";

        # Move windows between workspaces
        "move + 1" = {
          move_window_to_workspace = 0;
        };
        "move + 2" = {
          move_window_to_workspace = 1;
        };
        "move + 3" = {
          move_window_to_workspace = 2;
        };
        "move + 4" = {
          move_window_to_workspace = 3;
        };
        "move + 5" = {
          move_window_to_workspace = 4;
        };
        "move + 6" = {
          move_window_to_workspace = 5;
        };
        "move + 7" = {
          move_window_to_workspace = 6;
        };
        "move + 8" = {
          move_window_to_workspace = 7;
        };
        "move + 9" = {
          move_window_to_workspace = 8;
        };

        # Displays
        "display_focus + H" = {
          focus_display = "left";
        };
        "display_focus + L" = {
          focus_display = "right";
        };

        "display_window_move + H" = {
          move_window_to_display.selector = "left";
        };
        "display_window_move + L" = {
          move_window_to_display.selector = "right";
        };

        "display_workspace_move + H" = {
          move_workspace_to_display = {
            selector = "left";
            wrap_around = false;
          };
        };
        "display_workspace_move + L" = {
          move_workspace_to_display = {
            selector = "right";
            wrap_around = false;
          };
        };

        "focus + O" = "show_mission_control_all";
      };

      binding_modes.resize = {
        H = {
          resize_window_shrink = "horizontal";
        };
        L = {
          resize_window_grow = "horizontal";
        };
        J = {
          resize_window_grow = "vertical";
        };
        K = {
          resize_window_shrink = "vertical";
        };
        Escape = {
          binding_mode = "default";
        };
        Return = {
          binding_mode = "default";
        };
      };
    };
  };
}
