{...}: {
  plugins = {
    lsp = {
      enable = true;
      # Load LSP configuration just before reading a supported source file so
      # its FileType hook is ready for the first buffer. Servers still attach
      # only to the filetypes they support.
      lazyLoad.settings.event = [
        "BufReadPre *.nix"
        "BufNewFile *.nix"
        "BufReadPre *.rs"
        "BufNewFile *.rs"
        "BufReadPre *.java"
        "BufNewFile *.java"
        "BufReadPre *.py"
        "BufNewFile *.py"
        "BufReadPre *.js"
        "BufNewFile *.js"
        "BufReadPre *.jsx"
        "BufNewFile *.jsx"
        "BufReadPre *.ts"
        "BufNewFile *.ts"
        "BufReadPre *.tsx"
        "BufNewFile *.tsx"
        "BufReadPre *.md"
        "BufNewFile *.md"
        "BufReadPre *.c"
        "BufNewFile *.c"
        "BufReadPre *.h"
        "BufNewFile *.h"
        "BufReadPre *.cc"
        "BufNewFile *.cc"
        "BufReadPre *.cpp"
        "BufNewFile *.cpp"
        "BufReadPre *.cxx"
        "BufNewFile *.cxx"
        "BufReadPre *.hh"
        "BufNewFile *.hh"
        "BufReadPre *.hpp"
        "BufNewFile *.hpp"
        "BufReadPre *.hxx"
        "BufNewFile *.hxx"
      ];
      inlayHints = true;
      capabilities = ''
        capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
      '';
      servers = {
        rust_analyzer = {
          enable = true;
          installCargo = false;
          installRustc = false;
          settings."rust-analyzer".inlayHints.typeHints.enable = true;
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

    lint = {
      enable = true;
      lazyLoad.settings.ft = [
        "nix"
        "rust"
        "python"
        "javascript"
        "javascriptreact"
        "typescript"
        "typescriptreact"
        "c"
        "cpp"
        "markdown"
        "text"
      ];
      lintersByFt = {
        nix = ["statix" "codespell"];
        rust = ["clippy" "codespell"];
        python = ["ruff" "codespell"];
        javascript = ["biomejs" "codespell"];
        javascriptreact = ["biomejs" "codespell"];
        typescript = ["biomejs" "codespell"];
        typescriptreact = ["biomejs" "codespell"];
        c = ["clangtidy" "codespell"];
        cpp = ["clangtidy" "codespell"];
        markdown = ["codespell"];
        text = ["codespell"];
      };
      autoCmd = {
        event = ["BufWritePost"];
        callback.__raw = ''
          function()
            -- Clippy needs a Cargo workspace; skip standalone Rust files.
            if vim.bo.filetype == "rust" and not vim.fs.root(0, { "Cargo.toml" }) then
              require("lint").try_lint("codespell")
              return
            end

            require("lint").try_lint()
          end
        '';
      };
    };

    conform-nvim = {
      enable = true;
      lazyLoad.settings.ft = [
        "nix"
        "rust"
        "c"
        "cpp"
        "python"
        "javascript"
        "javascriptreact"
        "typescript"
        "typescriptreact"
        "markdown"
      ];
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
