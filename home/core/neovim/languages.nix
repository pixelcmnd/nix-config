{pkgs, ...}: {
  plugins = {
    lsp = {
      enable = true;
      servers = {
        rust_analyzer = {
          enable = true;
          package = pkgs.rustup;
          installCargo = false;
          installRustc = false;
        };
        jdtls.enable = true;
        pyright.enable = true;
        ts_ls.enable = true;
        marksman.enable = true;
        clangd.enable = true;
        nixd = {
          enable = true;
          settings.nixd = {
            nixpkgs.expr = "import <nixpkgs> { }";
            formatting.command = ["alejandra"];
          };
        };
      };
    };

    conform-nvim = {
      enable = true;
      settings = {
        formatters_by_ft = {
          nix = ["alejandra"];
          rust = ["rustfmt"];
          c = ["clang_format"];
          cpp = ["clang_format"];
          python = ["ruff_format"];
          javascript = ["biome"];
          javascriptreact = ["biome"];
          typescript = ["biome"];
          typescriptreact = ["biome"];
          markdown = ["prettier"];
        };
        format_on_save = {
          lsp_fallback = true;
          timeout_ms = 1000;
        };
      };
    };
  };
}
