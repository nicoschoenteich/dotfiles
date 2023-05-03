-- required steps:
-- git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
-- :PackerInstall
-- :PackerCompile
-- make sure to install https://github.com/ryanoasis/nerd-fonts

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use({
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional
		}
	})
end)
