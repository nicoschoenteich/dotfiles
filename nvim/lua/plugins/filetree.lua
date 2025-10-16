vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

return {
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("nvim-tree").setup({
				-- call empty function to not apply default and interfere with telescope
				on_attach = function() end,
				git = {
					ignore = false
				}
			})

			local api = require "nvim-tree.api"

			-- reimplement some of the default keybindings only for NvimTree files
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "NvimTree" },
				callback = function()
					vim.keymap.set("n", "<Enter>", api.node.open.edit, { buffer = true })
					vim.keymap.set("n", "fv", api.node.open.vertical, { buffer = true })
					vim.keymap.set("n", "r", api.fs.rename, { buffer = true })
					vim.keymap.set("n", "d", api.fs.remove, { buffer = true })
					vim.keymap.set("n", "n", api.fs.create, { buffer = true })
					vim.keymap.set("n", "c", api.fs.copy.node, { buffer = true })
					vim.keymap.set("n", "p", api.fs.paste, { buffer = true })

				end
			})

			vim.keymap.set("n", "fe", ":NvimTreeFocus<Enter>")
		end
	},
	{
		"nvim-tree/nvim-web-devicons"
	}
}
