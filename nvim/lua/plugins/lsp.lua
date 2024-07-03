return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
		config = function()
			require("mason-lspconfig").setup {
				ensure_installed = { "marksman" },
				automatic_installation = true
			}
			require("mason-lspconfig").setup_handlers {
				function(server)
					require("lspconfig")[server].setup {
						capabilities = require("cmp_nvim_lsp").default_capabilities()
					}
				end
			}
		end
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require "lspconfig"
			local configs = require "lspconfig.configs"

			-- formatting
			vim.keymap.set("n", "lf", function()
				if (vim.bo.filetype == "json") then
					vim.cmd("%!jq . --tab")
				elseif (vim.bo.filetype == "xml") then
					vim.cmd("%!xq % --tab")
				else
					vim.lsp.buf.format()
				end
			end, {})

			-- xml views for ui5
			vim.keymap.set("n", "ui5", function()
				if (vim.bo.filetype == "xml") then
					local currentLine = vim.api.nvim_get_current_line()
					local currentControl = string.match(currentLine, "<([^ ]*)")
					local namespaceId = ""
					if string.find(currentControl, ":") then
						namespaceId = ":" .. currentControl:sub(1, currentControl:find(":", 1, true) - 1)
						currentControl = string.match(currentControl, ":(.*)")
					end

					local currentParentDir = vim.fn.fnamemodify(debug.getinfo(1).source:sub(2), ":h")
					local currentFileContent = table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false))
					local currentNamespace = string.match(currentFileContent, "xmlns" .. namespaceId .. "=\"([^ \"]*)")
					local currentNamespaceAndControl = currentNamespace .. "." .. currentControl
					local currentAPIReference = "/ui5/" .. currentNamespace .. ".json"

					local appendToUi5File = function(content, force)
						local file = io.open(currentParentDir .. "/ui5/ui5.md", "r")
						if file and not force then
							content = file:read("*a") .. content
							file:close()
						end
						file = io.open(currentParentDir .. "/ui5/ui5.md", "w")
						if not file then return nil end
						file:write(content)
						file:close()
					end

					appendToUi5File("# " .. currentNamespaceAndControl .. "\n\n", true)
					appendToUi5File("🔗 [" ..
						currentNamespaceAndControl ..
						"](https://ui5.sap.com/#/api/" .. currentNamespaceAndControl .. ")\n\n>")
					os.execute("cat " ..
						currentParentDir .. currentAPIReference ..
						" | jq -r '.symbols[] | select(.name==\"" ..
						currentNamespaceAndControl ..
						"\") | .description' >> " ..
						currentParentDir .. "/ui5/ui5.md")
					-- | sed -r 's/<p>//g' | sed -r 's_</p>_\\n>\\n>_g' | sed -r 's/<code>/`/g' | sed -r 's_</code>_`_g' | sed -r 's/<b>/**/g' | sed -r 's_</b>_**_g' 
					appendToUi5File("\n## Properties\n\n")
					os.execute("cat " ..
						currentParentDir .. currentAPIReference ..
						" | jq -r '.symbols[] | select(.name==\"" ..
						currentNamespaceAndControl ..
						"\") | .\"ui5-metadata\".properties[] | .name' >> " .. currentParentDir .. "/ui5/ui5.md")
					appendToUi5File("\n## Methods\n\n")
					os.execute("cat " ..
						currentParentDir .. currentAPIReference ..
						" | jq -r '.symbols[] | select(.name==\"" ..
						currentNamespaceAndControl ..
						"\") | .methods[] | .name' >> " .. currentParentDir .. "/ui5/ui5.md")

					vim.cmd("vsplit " .. currentParentDir .. "/ui5/ui5.md")
				else
					vim.lsp.buf.format()
				end
			end, {})

			-- lua
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" }
						}
					}
				}
			})

			-- TypeScript
			lspconfig.tsserver.setup {
				on_attach = function() end,
				filetypes = { "javascript", "typescript", "typescriptreact", "typescript.tsx" },
				cmd = { "typescript-language-server", "--stdio" },
				capabilities = capabilities
			}

			-- cds
			configs.sapcds_lsp = {
				default_config = {
					cmd = { "cds-lsp", "--stdio" },
					filetypes = { "cds" },
					root_dir = lspconfig.util.root_pattern(".git", "package.json"),
					settings = {},
				}
			}
			lspconfig.sapcds_lsp.setup({ on_attach = function() end })

			vim.keymap.set("n", "lh", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "ld", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "lr", vim.lsp.buf.references, {})
		end
	}
}
