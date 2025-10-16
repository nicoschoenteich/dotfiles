return {
	"nicoschoenteich/nightfox.nvim",
	config = function()
		require("nightfox").setup({
			options = {
				transparent = true,
				styles = {
					comments = "italic"
				}
			}
		})
		vim.cmd "colorscheme saptechedlightfox"
	end
}
