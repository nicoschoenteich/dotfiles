local function status_line()
	local rightAlign = "%="
	local parentDir = "%{expand('%:p:h:t')}"
	local currentFile = "%t"
	return rightAlign .. parentDir .. "/" .. currentFile
end

vim.opt.statusline = status_line()

-- only show most recent status line (think of multiple windows)
vim.opt.laststatus = 3
