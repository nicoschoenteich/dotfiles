return {
	"mfussenegger/nvim-dap",
	dependencies = {
		-- "rcarriga/nvim-dap-ui",
		-- "nvim-neotest/nvim-nio",
		-- "mxsdev/nvim-dap-vscode-js"
	},
	config = function()
		local dap = require("dap")
		dap.set_log_level("DEBUG")
		vim.keymap.set('n', '<leader>a',
			function()
				print("--DEBUG--")
				dap.run({
					type = 'node2',
					request = 'attach',
					cwd = vim.fn.getcwd(),
					sourceMaps = true,
					protocol = 'inspector',
					skipFiles = { '<node_internals>/**/*.js' },
				})
			end)
		vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<Leader>c", dap.continue, {})
		vim.keymap.set("n", '<Leader>s', dap.step_over, {})
		vim.keymap.set('n', '<leader>r', ":lua require'dap'.repl.open({}, 'vsplit')")
		vim.keymap.set({ 'n', 'v' }, '<Leader>h', function()
			require('dap.ui.widgets').hover()
		end)

		vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define('DapBreakpointRejected',
			{ text = '🔵', texthl = '', linehl = '', numhl = '' })
		vim.fn.sign_define('DapStopped', { text = "➡️➡️", texthl = "", linehl = "", numhl = "" })

		dap.adapters.node2 = {
			type = 'executable',
			command = 'node',
			args = { "/Users/i533499/github/microsoft/vscode-node-debug2/out/src/nodeDebug.js" },
		}

		-- local dapui = require("dapui")
		-- dapui.setup()
		-- dap.listeners.before.attach.dapui_config = function()
		-- 	dapui.open()
		-- end
		-- dap.listeners.before.launch.dapui_config = function()
		-- 	dapui.open()
		-- end
		-- dap.listeners.before.event_terminated.dapui_config = function()
		-- 	dapui.close()
		-- end
		-- dap.listeners.before.event_exited.dapui_config = function()
		-- 	dapui.close()
		-- end

		-- require("dap-vscode-js").setup({
		-- 	debugger_path = "/Users/i533499/github/microsoft/vscode-js-debug/js-debug/src/dapDebugServer.js"
		-- })

		-- require("dap").adapters["pwa-node"] = {
		-- 	type = "server",
		-- 	host = "localhost",
		-- 	port = "${port}",
		-- 	executable = {
		-- 		command = "node",
		-- 		args = { "/Users/i533499/github/microsoft/vscode-js-debug/js-debug/src/dapDebugServer.js", "${port}" },
		-- 	}
		-- }

		-- require("dap").configurations.javascript = {
		-- 	{
		-- 		type = "pwa-node",
		-- 		request = "launch",
		-- 		name = "Launch file",
		-- 		program = "${file}",
		-- 		cwd = "${workspaceFolder}"
		-- 	}
		-- }
	end
}
