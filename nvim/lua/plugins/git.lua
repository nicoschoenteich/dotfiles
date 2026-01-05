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
					{ "github/copilot.vim" },
					{ "nvim-lua/plenary.nvim", branch = "master" },
				},
				build = "make tiktoken",
				vim.keymap.set("n", ":chat", ":CopilotChatOpen", {}),
				-- open chat with highlighted text and weirdly remove range selection '<,'>
				vim.keymap.set("v", ":chat", ":CopilotChatOpen<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><BS><BS><BS><BS><BS>", {}),
				vim.keymap.set("n", ":reset", ":CopilotChatReset", {})
			}
		end
	}
}
