{
  extraConfigLua = ''
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "markdown", "text" },
      callback = function() vim.opt_local.spell = true end,
    })
  '';
}
