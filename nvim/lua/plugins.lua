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
	'nvim-tree/nvim-web-devicons',
	'neovim/nvim-lspconfig',
	{
		'nvim-treesitter/nvim-treesitter',
		dependencies = {
			'nvim-treesitter/nvim-treesitter-textobjects'
		},
		build = ':TSUpdate'
	},
	'EdenEast/nightfox.nvim',
	'jiangmiao/auto-pairs',
	'tpope/vim-commentary'
})
