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
		config = function()
			require("CopilotChat").setup {
				dependencies = {
					{ "github/copilot.vim" },        -- or zbirenbaum/copilot.lua
					{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
				},
				build = "make tiktoken",             -- Only on MacOS or Linux
				opts = {
					-- See Configuration section for options
				},
				-- See Commands section for default commands if you want to lazy load on them

				-- open chat in normal mode to open Copilot chat
				vim.keymap.set("n", ":chat", ":CopilotChatOpen", {}),
				-- open chat with highlighted text and weirdly remove range selection '<,'>
				vim.keymap.set("v", ":chat", ":CopilotChatOpen<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><BS><BS><BS><BS><BS>", {})
			}
		end
	},
}
