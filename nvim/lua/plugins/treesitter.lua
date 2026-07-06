return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects"
	},
	build = ":TSUpdate",
	opts = {
		highlight = {
			enable = true
		}
	},
	config = function(_, opts)
		-- :TSInstall cds
		-- https://github.com/cap-js-community/tree-sitter-cds/blob/main/nvim/setup-nvim-treesitter.sh has to be executed locally for this to work
		local parsers = require("nvim-treesitter.parsers")
		parsers.cds = {
			tier = 2,
			install_info = {
				url = "https://github.com/SAP-archive/tree-sitter-cds",
				branch = "main",
				files = { "src/parser.c", "src/scanner.c" }
			},
		}
		require("nvim-treesitter").setup(opts)
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "cds",
			callback = function() vim.treesitter.start() end,
		})
	end
}
