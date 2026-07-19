{...}: {
  # Config version for compatibility and deprecations
  # See: https://nikitabobko.github.io/AeroSpace/guide#config-version
  # Fallback value (if you omit the key): config-version = 1
  programs.aerospace.settings.config-version = 2;

  # Automatically reload the config when the config file is saved
  # After setting this to true, reload once manually to start the auto-reloading
  programs.aerospace.settings.auto-reload-config = true;

  # Normalizations. See: https://nikitabobko.github.io/AeroSpace/guide#normalization
  programs.aerospace.settings.enable-normalization-flatten-containers = true;
  programs.aerospace.settings.enable-normalization-opposite-orientation-for-nested-containers = true;

  # See: https://nikitabobko.github.io/AeroSpace/guide#layouts
  # The 'accordion-padding' specifies the size of accordion padding
  # You can set 0 to disable the padding feature
  programs.aerospace.settings.accordion-padding = 30;
  programs.aerospace.settings.default-root-container-layout = "tiles";
  programs.aerospace.settings.default-root-container-orientation = "auto";

  # Mouse follows focus when focused monitor changes
  # Drop it from your config, if you don't like this behavior
  # See https://nikitabobko.github.io/AeroSpace/guide#on-focus-changed-callbacks
  # See https://nikitabobko.github.io/AeroSpace/commands#move-mouse
  # Fallback value (if you omit the key): on-focused-monitor-changed = []
  programs.aerospace.settings.on-focused-monitor-changed = ["move-mouse monitor-lazy-center"];
  programs.aerospace.settings.automatically-unhide-macos-hidden-apps = false;
  programs.aerospace.settings.persistent-workspaces = ["1" "2" "3" "4" "5" "6" "7" "8" "9" "0"];
}
