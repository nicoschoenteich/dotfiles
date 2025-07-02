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
		vim.cmd("%!jq . --tab")
	elseif (vim.bo.filetype == "xml") then
		vim.cmd("%!xq % --tab")
	else
		vim.lsp.buf.format()
	end
end, {})
