return {
	"EdenEast/nightfox.nvim",
	config = function()
		require("nightfox").setup({
			options = {
				transparent = true,
				styles = {
					comments = "italic"
				}
			}
			-- palettes = {
				-- duskfox = {
				-- 	cyan = "#2CE0BF",
				-- 	green = "#2CE0BF",
				-- 	orange = "#FF8AF0",
				-- 	red = "#FF8AF0",
				-- 	blue = "#1B90FF",
				-- 	white = "#FFFFFF"
				-- }
			-- }
		})
		vim.cmd "colorscheme carbonfox"
	end
	-- "scottmckendry/cyberdream.nvim",
	-- config = function()
	-- 	require("cyberdream").setup({
	-- 		transparent = true,
	-- 		italic_comments = true,
	-- 		hide_fillchars = false,
	-- 		borderless_telescope = false,
	-- 		terminal_colors = false,
	-- 		theme = {
	-- 			variant = "default"
	-- 		}
	-- 	})
	-- 	vim.cmd("colorscheme cyberdream")
	-- end
}
