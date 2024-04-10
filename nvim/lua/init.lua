-- the order does matter

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
