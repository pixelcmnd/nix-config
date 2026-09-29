{pkgs, ...}: {
  extraPlugins = [pkgs.vimPlugins.gruvbox-nvim];

  colorschemes.gruvbox.enable = true;

  opts = {
    number = true;
    relativenumber = true;
    mouse = "a";
    clipboard = "unnamedplus";
    undofile = true;
    ignorecase = true;
    smartcase = true;
    expandtab = true;
    shiftwidth = 2;
    tabstop = 2;
    scrolloff = 8;
    signcolumn = "yes";
    splitright = true;
    splitbelow = true;
    termguicolors = true;
    updatetime = 250;
    completeopt = ["menu" "menuone" "noselect"];
    spelllang = ["en" "ru" "es"];
    spellfile = "~/.local/share/nvim/site/spell/custom.utf-8.add";
  };

  globals.mapleader = " ";
  globals.maplocalleader = "\\";
}
