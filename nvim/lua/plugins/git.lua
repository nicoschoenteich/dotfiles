return {
	{
		"tpope/vim-fugitive"
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup{
				current_line_blame = true,
				current_line_blame_opts = {
					delay = 0
			  	},
				current_line_blame_formatter_opts = {
					relative_time = true,
				}
			}

			vim.keymap.set("n", "gh", ":Gitsigns preview_hunk<Enter>", {})
		end
	},
	{
		"github/copilot.vim"
	}
}
