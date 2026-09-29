{
  keymaps = [
    {
      mode = "i";
      key = "jk";
      action = "<Esc>";
      options.desc = "Exit insert mode";
    }
    {
      mode = "n";
      key = "<C-d>";
      action = "<C-d>zz";
      options.desc = "Half-page down and center";
    }
    {
      mode = "n";
      key = "<C-u>";
      action = "<C-u>zz";
      options.desc = "Half-page up and center";
    }
    {
      mode = "n";
      key = "<leader>us";
      action = ":setlocal spell!<CR>";
      options.desc = "Toggle spell checking";
    }
    {
      mode = "n";
      key = "<leader>e";
      action = ":Oil<CR>";
      options.desc = "File explorer";
    }
    {
      mode = "n";
      key = "<leader>ff";
      action = ":Telescope find_files<CR>";
      options.desc = "Find files";
    }
    {
      mode = "n";
      key = "<leader>fg";
      action = ":Telescope live_grep<CR>";
      options.desc = "Search in files";
    }
    {
      mode = "n";
      key = "<leader>fb";
      action = ":Telescope buffers<CR>";
      options.desc = "Find buffers";
    }
    {
      mode = "n";
      key = "<leader>tt";
      action = "<cmd>lua Snacks.terminal.toggle()<CR>";
      options.desc = "Toggle terminal";
    }
    {
      mode = "n";
      key = "<C-h>";
      action = "<cmd>lua require('smart-splits').move_cursor_left()<CR>";
      options.desc = "Move to left window";
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<cmd>lua require('smart-splits').move_cursor_down()<CR>";
      options.desc = "Move to lower window";
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<cmd>lua require('smart-splits').move_cursor_up()<CR>";
      options.desc = "Move to upper window";
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<cmd>lua require('smart-splits').move_cursor_right()<CR>";
      options.desc = "Move to right window";
    }
    {
      mode = "n";
      key = "<A-h>";
      action = "<cmd>lua require('smart-splits').resize_left()<CR>";
      options.desc = "Resize window left";
    }
    {
      mode = "n";
      key = "<A-j>";
      action = "<cmd>lua require('smart-splits').resize_down()<CR>";
      options.desc = "Resize window down";
    }
    {
      mode = "n";
      key = "<A-k>";
      action = "<cmd>lua require('smart-splits').resize_up()<CR>";
      options.desc = "Resize window up";
    }
    {
      mode = "n";
      key = "<A-l>";
      action = "<cmd>lua require('smart-splits').resize_right()<CR>";
      options.desc = "Resize window right";
    }
    {
      mode = "n";
      key = "<leader>wv";
      action = "<cmd>vsplit<CR>";
      options.desc = "Split window vertically";
    }
    {
      mode = "n";
      key = "<leader>ws";
      action = "<cmd>split<CR>";
      options.desc = "Split window horizontally";
    }
    {
      mode = "n";
      key = "<leader>wd";
      action = "<cmd>close<CR>";
      options.desc = "Close window";
    }
    {
      mode = "n";
      key = "<leader>wo";
      action = "<C-w>=";
      options.desc = "Equalize windows";
    }
    {
      mode = "n";
      key = "<leader>tn";
      action = "<cmd>tabnew<CR>";
      options.desc = "New tab";
    }
    {
      mode = "n";
      key = "<leader>td";
      action = "<cmd>tabclose<CR>";
      options.desc = "Close tab";
    }
    {
      mode = "n";
      key = "]t";
      action = "<cmd>tabnext<CR>";
      options.desc = "Next tab";
    }
    {
      mode = "n";
      key = "[t";
      action = "<cmd>tabprevious<CR>";
      options.desc = "Previous tab";
    }
    {
      mode = "n";
      key = "<leader>ca";
      action = "<cmd>lua vim.lsp.buf.code_action()<CR>";
      options.desc = "Code action";
    }
    {
      mode = "n";
      key = "<leader>cr";
      action = "<cmd>lua vim.lsp.buf.rename()<CR>";
      options.desc = "Rename symbol";
    }
  ];
}
