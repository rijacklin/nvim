return {
	"jose-elias-alvarez/null-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.diagnostics.eslint.with({
					diagnostic_config = {
						virtual_text = false,
					}
				}),
				null_ls.builtins.formatting.prettierd.with({
					diagnostic_config = {
						virtual_text = false,
					}
				}),
				-- null_ls.builtins.formatting.stylua,
				-- null_ls.builtins.completion.spell,

				-- Pylint
				null_ls.builtins.diagnostics.pylint.with({
					diagnostic_config = {
						underline = false,
						virtual_text = false,
						signs = false
					},
					method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
				}),
			},
			-- Format on save
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
							-- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
							vim.lsp.buf.format()
						end,
					})
				end
			end,
		})
	end,
}
