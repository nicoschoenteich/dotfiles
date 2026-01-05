-- run (locally installed) prettier on save
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = { "*.js", "*.ts", "*.json", "*.css", "*.html", "*.yaml" },
	callback = function(args)
		if vim.fn.findfile("prettier.config.js", ".;") == "" then return end

		vim.fn.jobstart({
			"node_modules/.bin/prettier",
			"--write",
			args.file,
		}, {
			on_exit = function()
				-- Reload buffer after prettier modifies the file
				vim.schedule(function()
					if vim.api.nvim_buf_is_valid(args.buf) then
						vim.cmd("checktime")

						vim.notify(args.file .. " written & formatted with Prettier 🎨", vim.log.levels.INFO, {
							title = vim.fn.fnamemodify(args.file, ":t"),
						})
					end
				end)
			end
		})
	end
})

-- run (globally instaleld) prettier on save for xml files
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = { "*.xml" },
	callback = function(args)
		if vim.fn.findfile("prettier.config.js", ".;") == "" then return end

		vim.fn.jobstart({
			"prettier",
			"--plugin=/Users/i533499/.nvm/versions/node/v22.16.0/lib/node_modules/@prettier/plugin-xml/src/plugin.js",
			"--single-attribute-per-line",
			"true",
			"--xml-whitespace-sensitivity",
			"ignore",
			-- "--tab-width",
			-- "4",
			"--write",
			args.file,
		}, {
			on_exit = function()
				-- Reload buffer after prettier modifies the file
				vim.schedule(function()
					if vim.api.nvim_buf_is_valid(args.buf) then
						vim.cmd("checktime")

						vim.notify(args.file .. " written & formatted with Prettier 🎨", vim.log.levels.INFO, {
							title = vim.fn.fnamemodify(args.file, ":t"),
						})
					end
				end)
			end,
			on_stderr = function(chanid, data, name)
				print("stderr, data:" .. vim.inspect(data))
			end
		})
	end
})

-- run cds lsp on save
-- this only works if cds lint ("cds add lint") is locally installed in the project
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = { "*.cds" },
	callback = function(args)
		vim.fn.jobstart({
			"format-cds",
			-- "--tabSize=2", -- default anyway, just to demonstrate passing args
			args.file,
			"--force"
		}, {
			on_exit = function()
				-- Reload buffer after prettier modifies the file
				vim.schedule(function()
					if vim.api.nvim_buf_is_valid(args.buf) then
						vim.cmd("checktime")

						vim.notify(args.file .. " written & formatted with cds-lsp 🎨", vim.log.levels.INFO, {
							title = vim.fn.fnamemodify(args.file, ":t"),
						})
					end
				end)
			end
		})
	end
})

return {}
