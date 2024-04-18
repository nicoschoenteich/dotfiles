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
			
			-- vim.keymap.set() for some reason doesn't work here
			vim.api.nvim_set_keymap("n", "n", "a", {})
			vim.api.nvim_set_keymap("n", ":f", ":NvimTreeFocus", {})

		end
	},
	{
		"nvim-tree/nvim-web-devicons"	
	}
}
