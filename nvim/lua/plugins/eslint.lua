vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint("eslint")
	end
})

return {
	{
		"mfussenegger/nvim-lint",
	}
}
