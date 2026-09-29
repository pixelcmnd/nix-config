{inputs, ...}: {
  imports = [inputs.nixvim.homeModules.nixvim];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    imports = [
      ./options.nix
      ./keymaps.nix
      ./plugins.nix
      ./languages.nix
      ./autocmds.nix
    ];
  };
}
