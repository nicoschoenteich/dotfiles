local function status_line()

	-- local file_name = "%t"
	-- local right_align = "%="
	-- local line_no = "%10([%l/%L%)]"

	-- return string.format(
    	-- "%s%s%s",
	-- 	right_align,
	-- 	file_name,
	-- 	line_no
	-- )

	return "%=%t"

end

vim.opt.statusline = status_line()

-- only show most recent status line (think of multiple windows)
vim.opt.laststatus=3
