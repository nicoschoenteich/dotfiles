-- use system clipboard
vim.opt.clipboard = "unnamedplus"

vim.opt.syntax = "ON"
vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.numberwidth = 2

vim.wo.wrap = true
vim.wo.linebreak = true

vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.encoding = "utf-8"

vim.g.markdown_folding = 1
vim.opt.foldmethod = "syntax"
vim.opt.foldlevel = 99

vim.g.markdown_fenced_languages = {"javascript", "js=javascript", "json=javascript", "xml"}

vim.opt.spell = true
vim.opt.spelllang = "en_us"

-- make sure vim-commentary can handle cds files
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.cds"},
  command = "setlocal commentstring=//%s",
})

vim.cmd "colorscheme carbonfox"
