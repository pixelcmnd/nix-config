{config, ...}: {
  plugins = {
    web-devicons.enable = true;
    which-key.enable = true;
    oil = {
      enable = true;
      settings = {
        delete_to_trash = true;
        view_options.show_hidden = true;
      };
    };
    telescope.enable = true;
    gitsigns.enable = true;
    lualine.enable = true;
    comment.enable = true;
    snacks = {
      enable = true;
      settings = {
        dashboard = {
          enabled = true;
          preset = {
            header = ''
              ▄▄▄    ▄▄▄  ▄▄▄▄▄▄▄   ▄▄▄▄▄   ▄▄▄▄  ▄▄▄▄ ▄▄▄▄▄ ▄▄▄      ▄▄▄
              ████▄  ███ ███▀▀▀▀▀ ▄███████▄ ▀███  ███▀  ███  ████▄  ▄████
              ███▀██▄███ ███▄▄    ███   ███  ███  ███   ███  ███▀████▀███
              ███  ▀████ ███      ███▄▄▄███  ███▄▄███   ███  ███  ▀▀  ███
              ███    ███ ▀███████  ▀█████▀    ▀████▀   ▄███▄ ███      ███
            '';
            keys = [
              {
                icon = " ";
                key = "f";
                desc = "Find files";
                action = ":Telescope find_files";
              }
              {
                icon = " ";
                key = "n";
                desc = "New file";
                action = ":ene | startinsert";
              }
              {
                icon = " ";
                key = "g";
                desc = "Search in files";
                action = ":Telescope live_grep";
              }
              {
                icon = " ";
                key = "r";
                desc = "Recent files";
                action = ":Telescope oldfiles";
              }
              {
                icon = " ";
                key = "c";
                desc = "Nix config";
                action = ":Telescope find_files cwd=~/Projects/nix-config";
              }
              {
                icon = " ";
                key = "q";
                desc = "Quit";
                action = ":qa";
              }
            ];
          };
          sections = [
            {section = "header";}
            {
              section = "keys";
              gap = 1;
              padding = 1;
            }
            {
              section = "recent_files";
              limit = 8;
            }
          ];
        };
        terminal.enabled = true;
      };
    };
    smart-splits.enable = true;
    treesitter = {
      enable = true;
      grammarPackages = with config.plugins.treesitter.package.builtGrammars; [
        bash
        c
        cpp
        java
        javascript
        json
        lua
        markdown
        markdown_inline
        nix
        python
        rust
        toml
        tsx
        typescript
        vim
        vimdoc
        yaml
      ];
    };
  };
}
