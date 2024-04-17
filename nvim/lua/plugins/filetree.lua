vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

return {
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("nvim-tree").setup({
				git = {
					ignore = false
				}
			})
		end
	},
	{
		"nvim-tree/nvim-web-devicons"	
	}
}
