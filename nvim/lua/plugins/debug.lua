return {
	-- Core DAP engine
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			-- JS/TS Debug Adapter integration
			{
				"mxsdev/nvim-dap-vscode-js",
				dependencies = {
					"mfussenegger/nvim-dap",
				},
				config = function()
					-- Setup vscode-js-debug
					local ok, dap_vscode = pcall(require, "dap-vscode-js")
					if not ok then
						vim.notify("nvim-dap-vscode-js not found", vim.log.levels.ERROR)
						return
					end

					dap_vscode.setup({
						debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug", -- path managed by lazy.nvim
						adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
					})

					-- DAP configurations for JS/TS
					local dap = require("dap")
					for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
						dap.configurations[language] = {
							{
								type = "pwa-node",
								request = "launch",
								name = "Launch current file",
								program = "${file}",
								cwd = "${workspaceFolder}",
								sourceMaps = true,
								protocol = "inspector",
								console = "integratedTerminal",
							},
							{
								type = "pwa-node",
								request = "attach",
								name = "Attach to process",
								processId = require("dap.utils").pick_process,
								cwd = "${workspaceFolder}",
							},
							{
								type = "pwa-chrome",
								request = "launch",
								name = "Launch Chrome (localhost:3000)",
								url = "http://localhost:3000",
								webRoot = "${workspaceFolder}",
							},
						}
					end
				end,
			},

		},

		-- 🔧 DAP Keymaps
		config = function()
			local dap = require("dap")

			vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint, {})
			vim.keymap.set("n", "<Leader>c", dap.continue, {})
			vim.keymap.set("n", "<Leader>s", dap.step_over, {})
			vim.keymap.set("n", "<leader>r", ":lua require'dap'.repl.open({}, 'vsplit')")
			vim.keymap.set({ "n", "v" }, "<Leader>h", function()
				require("dap.ui.widgets").hover()
			end)

			vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
			vim.fn.sign_define("DapBreakpointRejected",
				{ text = "💀", texthl = "", linehl = "", numhl = "" })
			vim.fn.sign_define("DapStopped", { text = "➡️", texthl = "", linehl = "", numhl = "" })
		end,
	},
}
