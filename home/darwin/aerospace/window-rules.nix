{...}: {
  programs.aerospace.settings.on-window-detected = [
    {
      "if" = "test %{app-bundle-id} = com.apple.systempreferences || test %{app-bundle-id} = com.apple.finder || test %{app-bundle-id} = com.bitwarden.desktop || test %{app-bundle-id} = com.linguangming.shadowrocket || test %{app-bundle-id} = io.ente.auth.mac";
      run = "layout floating";
    }
    {
      "if" = "test %{app-bundle-id} = org.mozilla.firefox || test %{app-bundle-id} = com.apple.Safari || test %{app-bundle-id} = net.imput.helium";
      run = "move-node-to-workspace 1";
    }
    {
      "if" = "test %{app-bundle-id} = com.googlecode.iterm2";
      run = "move-node-to-workspace 2";
    }
    {
      "if" = "test %{app-bundle-id} = ru.keepcoder.Telegram || test %{app-bundle-id} = org.whispersystems.signal-desktop";
      run = "move-node-to-workspace 5";
    }
    {
      "if" = "test %{app-bundle-id} = com.hnc.Discord || test %{app-bundle-id} = com.apple.mail";
      run = "move-node-to-workspace 6";
    }
    {
      "if" = "test %{app-bundle-id} = com.adibhanna.zennotes || test %{app-bundle-id} = com.super-productivity.app";
      run = "move-node-to-workspace 7";
    }
  ];
}
