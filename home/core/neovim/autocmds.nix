{
  extraConfigLua = ''
    vim.api.nvim_create_user_command("Fmt", function()
      require("conform").format({ async = true, lsp_format = "fallback" })
    end, { desc = "Format current buffer" })

    vim.cmd([[cnoreabbrev <expr> fmt getcmdtype() == ":" && getcmdline() == "fmt" ? "Fmt" : "fmt"]])

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "*",
      callback = function() vim.opt_local.spell = true end,
    })
  '';
}
