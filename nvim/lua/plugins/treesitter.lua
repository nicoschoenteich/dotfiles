return 	{
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects"
	},
	build = ":TSUpdate",
	config = function()

		vim.defer_fn(function()

		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
		parser_config.cds = {
			install_info = {
				-- https://github.com/cap-js-community/tree-sitter-cds/blob/main/nvim/setup-nvim-treesitter.sh has to be executed locally for this to work
				url = "https://github.com/cap-js-community/tree-sitter-cds.git",
				branch = "main",
				files = { "src/parser.c", "src/scanner.c" }
			},
			filetype = "cds",
			used_by = { "cdl", "hdbcds" }
		}

		require "nvim-treesitter.configs".setup({

			highlight = {
				enable = true
			}

		})
		end, 0)

	end
}

