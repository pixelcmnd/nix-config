{...}: {
  programs.zellij = {
    enable = true;
    settings = {
      theme = "gruvbox-dark";
      show_startup_tips = false;
    };
    extraConfig = ''
      // Use Ctrl+Alt as Zellij's primary modifier for mode switching.
      keybinds {
        unbind "Ctrl g" "Ctrl q" "Ctrl p" "Ctrl n" "Ctrl s" "Ctrl o" "Ctrl t" "Ctrl h" "Ctrl b"

        locked {
          bind "Ctrl Alt g" { SwitchToMode "Normal"; }
        }
        resize {
          bind "Ctrl Alt n" { SwitchToMode "Normal"; }
        }
        pane {
          bind "Ctrl Alt p" { SwitchToMode "Normal"; }
        }
        move {
          bind "Ctrl Alt h" { SwitchToMode "Normal"; }
        }
        tab {
          bind "Ctrl Alt t" { SwitchToMode "Normal"; }
        }
        scroll {
          bind "Ctrl Alt s" { SwitchToMode "Normal"; }
          bind "Ctrl b" { PageScrollUp; }
        }
        search {
          bind "Ctrl Alt s" { SwitchToMode "Normal"; }
          bind "Ctrl b" { PageScrollUp; }
        }
        session {
          bind "Ctrl Alt o" { SwitchToMode "Normal"; }
          bind "Ctrl Alt s" { SwitchToMode "Scroll"; }
        }
        tmux {
          bind "Ctrl Alt b" { Write 2; SwitchToMode "Normal"; }
        }
        shared_except "locked" {
          bind "Ctrl Alt g" { SwitchToMode "Locked"; }
          bind "Ctrl Alt q" { Quit; }
        }
        shared_except "pane" "locked" {
          bind "Ctrl Alt p" { SwitchToMode "Pane"; }
        }
        shared_except "resize" "locked" {
          bind "Ctrl Alt n" { SwitchToMode "Resize"; }
        }
        shared_except "scroll" "locked" {
          bind "Ctrl Alt s" { SwitchToMode "Scroll"; }
        }
        shared_except "session" "locked" {
          bind "Ctrl Alt o" { SwitchToMode "Session"; }
        }
        shared_except "tab" "locked" {
          bind "Ctrl Alt t" { SwitchToMode "Tab"; }
        }
        shared_except "move" "locked" {
          bind "Ctrl Alt h" { SwitchToMode "Move"; }
        }
        shared_except "tmux" "locked" {
          bind "Ctrl Alt b" { SwitchToMode "Tmux"; }
        }
      }

      // Suppress Zellij's first-launch welcome screen as well as startup tips.
      plugins {
        welcome-screen location="zellij:session-manager" {
          welcome_screen false
        }
      }
    '';
  };
}
