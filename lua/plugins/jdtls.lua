return {
	"mfussenegger/nvim-jdtls",
	lazy = false,
	config = function()
		local config = {
			dependencies = { "jdtls", "nvim-dap" },
			on_attach = on_attach,
			init_options = {
				bundles = {
					"/home/richard/lsp/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.52.0.jar"
				},
			}
		}

		config['on_attach'] = function(client, bufnr)
			-- With `hotcodereplace = 'auto' the debug adapter will try to apply code changes
			-- you make during a debug session immediately.
			-- Remove the option if you do not want that.
			require('jdtls').setup_dap({ hotcodereplace = 'auto' })
			require("jdtls.dap").setup_dap_main_class_configs()
		end
	end,
	-- require('dap.ext.vscode').load_launchjs()
}
