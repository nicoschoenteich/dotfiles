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

local plugins = {
	"nvim-tree/nvim-tree.lua",
	"nvim-tree/nvim-web-devicons",
	"EdenEast/nightfox.nvim",
	"neovim/nvim-lspconfig",
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects"
		},
		build = ":TSUpdate"
	},
	"jiangmiao/auto-pairs",
	"tpope/vim-commentary"
}

-- order of statements does matter
require("lazy").setup(plugins)

require("misc")
require("filetree")
require("statusline")
require("lsp")
require("treesitter")
require("keys")
