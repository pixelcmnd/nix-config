{inputs, ...}: {
  imports = [
    inputs.nixvim.homeModules.nixvim
    inputs.nvim-anywhere.homeManagerModules.default
  ];

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

  programs.nvim-anywhere.enable = true;
}
