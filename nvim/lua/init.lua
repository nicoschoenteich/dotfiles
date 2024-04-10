-- order of statements does matter

require('vars')
require('keys')
require('plugins')
require('nvim-tree').setup({
	git = {
		ignore = false
	}
})
require('statusline')
require('theme')
require('lsp')
require('treesitter')
