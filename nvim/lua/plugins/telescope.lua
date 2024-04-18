return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	dependencies = {
		"nvim-lua/plenary.nvim"
	},
	config = function()
		require("telescope").setup{
			defaults = {
				file_ignore_patterns = { "node_modules" }
			}
		}

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", ":ff<Enter>", builtin.find_files, {})
		vim.keymap.set("n", ":fg<Enter>", builtin.live_grep, {})
		vim.keymap.set("n", ":fb<Enter>", builtin.buffers, {})
		vim.keymap.set("n", ":fh<Enter>", builtin.help_tags, {})
	end
}
