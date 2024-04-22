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
			require("mason-lspconfig").setup{
				ensure_installed = { "marksman" },
				automatic_installation = true
			}
			require("mason-lspconfig").setup_handlers{
				function(server)
					require("lspconfig")[server].setup{
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
