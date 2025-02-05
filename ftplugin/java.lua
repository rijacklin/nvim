local home = vim.fn.getenv("HOME")

local config = {
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xms1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		"-jar",
		home .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.700.v20231214-2017.jar",
		"-configuration",
		home .. "/.local/share/nvim/mason/packages/jdtls/config_linux",
		"-data",
		home .. "/.local/share/nvim/mason/packages/jdtls/workspace",
		-- home .. "/lsp/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/plugins/org.eclipse.equinox.launcher_1.6.800.v20240426-1701.jar",
		-- "-configuration",
		-- home .. "/lsp/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/config_linux",
		-- "-data",
		-- home .. "/lsp/eclipse.jdt.ls/projects",
	},
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),

	-- Language server `initializationOptions`
	-- You need to extend the `bundles` with paths to jar files
	-- if you want to use additional eclipse.jdt.ls plugins.
	--
	-- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
	--
	-- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
	init_options = {
		bundles = { home.. "/lsp/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.52.0.jar" }
	},
	-- vim.api.nvim_create_autocmd("FileType", {
	-- 	pattern = ".java",
	-- 	callback = function()
	-- 		require("jdtls").start_or_attach(config)
	-- 	end,
	-- })
}

require('jdtls').start_or_attach(config)
-- require('jdtls').setup_dap({ hotcodereplace = 'auto' })
-- require("jdtls.dap").setup_dap_main_class_configs()
