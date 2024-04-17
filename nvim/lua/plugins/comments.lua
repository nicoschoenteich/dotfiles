-- cds
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.cds"},
  command = "setlocal commentstring=//%s",
})

return {
	"tpope/vim-commentary"
}
