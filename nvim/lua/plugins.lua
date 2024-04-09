local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
		'nvim-tree/nvim-tree.lua',
		'neovim/nvim-lspconfig',
		'nvim-tree/nvim-web-devicons',
		'nvim-treesitter/nvim-treesitter',
		'navarasu/onedark.nvim'
})

