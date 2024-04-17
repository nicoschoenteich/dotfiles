return {
	{
		"tpope/vim-fugitive"
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()

			-- implement key for ":Gitsigns toggle_current_line_blame"
		end
	}
}
