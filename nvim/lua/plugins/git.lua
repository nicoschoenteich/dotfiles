return {
	{
		"tpope/vim-fugitive"
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup {
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
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "github/copilot.vim" },              -- or zbirenbaum/copilot.lua
			{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
		},
		build = "make tiktoken",                   -- Only on MacOS or Linux
		opts = {
			-- See Configuration section for options
		},
		-- See Commands section for default commands if you want to lazy load on them
	},
}
