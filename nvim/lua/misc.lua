-- use system clipboard
vim.opt.clipboard = "unnamedplus"

vim.opt.syntax = "ON"
vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.numberwidth = 2

vim.wo.wrap = false
vim.wo.linebreak = true

vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.encoding = "utf-8"
vim.opt.spelllang = "en_us"

vim.g.markdown_folding = 1
vim.opt.foldmethod = "syntax"
vim.opt.foldlevel = 99

vim.g.markdown_fenced_languages = {"javascript", "js=javascript", "json=javascript", "xml"}

-- spell check and line wrap only for markdown files
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.md"},
  command = ":setlocal spell | setlocal wrap",
})

-- open images in os native image viewer
vim.api.nvim_create_autocmd({"BufWinEnter"}, {
  pattern = {"*.png", "*.jpg", "*.jpeg"},
  command= ":lua os.execute(\"open \" .. vim.api.nvim_buf_get_name(0)) vim.api.nvim_buf_delete(0, {})"
})

-- set transparent background for nvim-tree
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  command = ":hi NvimTreeNormal guibg=NONE",
})

-- use "fw" ("file window") in normal mode to switch between windows
vim.keymap.set("n", "fw", "<C-w>w", {})
