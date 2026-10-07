{config, ...}: {
  plugins = {
    lz-n.enable = true;
    web-devicons.enable = true;
    which-key.enable = true;
    lualine.enable = true;
    comment.enable = true;

    oil = {
      enable = true;
      lazyLoad.settings.cmd = "Oil";
      settings = {
        delete_to_trash = true;
        watch_for_changes = true;
        view_options.show_hidden = true;
        keymaps."<C-r>" = "actions.refresh";
      };
    };

    nvim-tree = {
      enable = true;

      settings = {
        view = {
          side = "left";
          width = 28;
          preserve_window_proportions = true;
        };

        renderer = {
          group_empty = true;
        };

        filters = {
          dotfiles = false;
        };
      };
    };

    telescope = {
      enable = true;
      lazyLoad.settings.cmd = "Telescope";
    };

    gitsigns = {
      enable = true;
      lazyLoad.settings.event = ["BufReadPre" "BufNewFile"];
    };

    flash = {
      enable = true;
      lazyLoad.settings.keys = [
        {
          __unkeyed-1 = "s";
          __unkeyed-2.__raw = ''function() require("flash").jump() end'';
          __unkeyed-3 = "Jump to text";
          mode = ["n" "x" "o"];
        }
      ];
    };

    bufferline = {
      enable = true;
      lazyLoad.settings.event = ["BufReadPost" "BufNewFile"];
      settings.options = {
        mode = "buffers";
        always_show_bufferline = false;
      };
    };

    cmp = {
      enable = true;
      settings = {
        preselect = "cmp.PreselectMode.None";
        snippet.expand = "function(args) vim.snippet.expand(args.body) end";
        mapping = {
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-n>" = "cmp.mapping.select_next_item()";
          "<C-p>" = "cmp.mapping.select_prev_item()";
          "<C-e>" = "cmp.mapping.abort()";
          "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<CR>" = "cmp.mapping.confirm({ select = false })";
        };
        sources = [
          {name = "nvim_lsp";}
          {name = "path";}
          {name = "buffer";}
        ];
      };
    };

    snacks = {
      enable = true;
      settings = {
        notifier.enabled = true;
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
      lazyLoad.settings.event = ["BufReadPre" "BufNewFile"];
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
