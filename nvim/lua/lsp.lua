vim.lsp.enable({
	"typescript", -- pointing to /nvim/lsp/typescript.lua
	"cds",
	"lua",
})

vim.diagnostic.config({ virtual_text = true })

vim.keymap.set("n", "lh", vim.lsp.buf.hover, {})
vim.keymap.set("n", "ld", vim.lsp.buf.definition, {})
vim.keymap.set("n", "lr", vim.lsp.buf.references, {})
vim.keymap.set("n", "lf", function()
	if (vim.bo.filetype == "json") then
		-- jq . --tab
		vim.cmd("%!jq .")
	elseif (vim.bo.filetype == "xml") then
		local file_path = vim.fn.expand("%:p")
		vim.cmd("%!prettier --plugin=/Users/i533499/.nvm/versions/node/v22.16.0/lib/node_modules/@prettier/plugin-xml/src/plugin.js --single-attribute-per-line true --xml-whitespace-sensitivity \"preserve\" --tab-width 4 " .. file_path)
	else
		vim.lsp.buf.format()
	end
end, {})
