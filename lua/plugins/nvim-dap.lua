return {
	"mfussenegger/nvim-dap",
	lazy = false,
	config = function()
		require("dapui").setup()
		local dap, dapui = require("dap"), require("dapui")

		-- ADAPTERS

		dap.adapters.php = {
			type = "executable",
			command = "node",
			args = { os.getenv("HOME") .. "/vscode-php-debug/out/phpDebug.js" },
		}

		dap.adapters.lldb = {
			type = "executable",
			command = "/usr/local/bin/lldb-vscode", -- adjust as needed
			name = "lldb",
		}

		local lldb = {
			name = "Launch lldb",
			type = "lldb", -- matches the adapter
			request = "launch", -- could also attach to a currently running process
			program = function()
				return vim.fn.input(
					"Path to executable: ",
					vim.fn.getcwd() .. "/",
					"file"
				)
			end,
			cwd = "${workspaceFolder}",
			stopOnEntry = false,
			args = {},
			runInTerminal = true,
		}

		-- CONFIGURATIONS

		-- dap.configurations.java = {
		-- 	{
		-- 		javaExec = "java",
		-- 		request = "launch",
		-- 		type = "java",
		-- 	},
		-- 	{
		-- 		type = 'java',
		-- 		request = 'attach',
		-- 		name = "Debug (Attach) - Remote",
		-- 		hostName = "127.0.0.1",
		-- 		port = 5005,
		-- 	},
		-- }

		dap.configurations.php = {
			{
				type = "php",
				request = "launch",
				name = "Listen for Xdebug",
				port = 9003,
				logs = true,
			}
		}

		dap.configurations.cpp = {
			lldb -- different debuggers or more configurations can be used here
		}

		dap.configurations.c = dap.configurations.cpp

		-- LISTENERS

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end
	end,
}
