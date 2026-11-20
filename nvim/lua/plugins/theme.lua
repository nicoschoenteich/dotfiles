return {
	dir = "/Users/I533499/github/nicoschoenteich/nightfox.nvim",
	config = function()
		require("nightfox").setup({
			options = {
				transparent = true,
				styles = {
					comments = "italic"
				}
			}
		})
		vim.cmd "colorscheme jouleworkdarkfox"
	end
}
