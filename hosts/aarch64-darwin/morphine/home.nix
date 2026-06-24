{myvars, ...}: {
  imports = [
    ../../../home/core
    ../../../home/darwin
  ];

  home.username = myvars.username;
  home.homeDirectory = "/Users/${myvars.username}";

  home.stateVersion = "25.11";
}
