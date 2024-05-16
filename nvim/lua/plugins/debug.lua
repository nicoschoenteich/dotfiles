return {
	"mfussenegger/nvim-dap",
	config = function()
		local dap = require("dap")
		dap.set_log_level("DEBUG")
		vim.keymap.set("n", "<leader>a",
			function()
				print("--DEBUG--")
				dap.run({
					type = "node2",
					request = "attach",
					cwd = vim.fn.getcwd(),
					sourceMaps = true,
					protocol = "inspector",
					skipFiles = { "<node_internals>/**/*.js" },
				})
			end)
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
		vim.fn.sign_define("DapStopped", { text = "➡️➡️", texthl = "", linehl = "", numhl = "" })

		dap.adapters.node2 = {
			type = "executable",
			command = "node",
			args = { "/Users/i533499/github/microsoft/vscode-node-debug2/out/src/nodeDebug.js" },
		}
	end
}
