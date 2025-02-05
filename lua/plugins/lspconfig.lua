-- LSP support
local Plugin = {'neovim/nvim-lspconfig'} 
local user = {}

Plugin.dependencies = {
		{'j-hui/fidget.nvim', branch = 'legacy'},
		{'williamboman/mason.nvim'},
		{'williamboman/mason-lspconfig.nvim'},
		{'hrsh7th/cmp-nvim-lsp'},
		{'ziglang/zig.vim'},
}

Plugin.cmd = 'Lsp'

function Plugin.config()
		user.diagnostics()
		user.handlers()

		require('fidget').setup({
				text = {
						spinner = 'moon'
				},
				window = {
						blend = 0
				},
				sources = {
						['null-ls'] = {ignore = true}
				}
		})

		require('mason').setup({
				ui = {border = 'rounded'},
				-- providers = {
    --         "mason.providers.client",
    --         "mason.providers.registry-api",
				-- },
				opts = function (_, opts)
						vim.list_extend(opts.ensure_installed, { "prettierd" })
				end
		})

		require('mason-lspconfig').setup({
				automatic_installation = true
		})

		-- require('lspconfig').html.setup{}
		-- require('lspconfig').emmet_ls.setup{}
		-- require('lspconfig').cssls.setup{}
		-- require('lspconfig').tailwindcss.setup{}
		-- require('lspconfig').tsserver.setup{
		-- 	tsserver = {
		-- 		root_dir = function(...)
		-- 			return require("lspconfig.util").root_pattern(".git")(...)
		-- 		end,
		-- 	},
		-- }

		-- require('lspconfig').efm.setup {
		-- 		init_options = {documentFormatting = true},
		-- 		settings = {
		-- 				rootMarkers = {".git/"},
		-- 				languages = {
		-- 						prettierd = {
		-- 							formatCommand = 'prettierd "${INPUT}"',
		-- 							formatStdin = true,
		-- 							env = {
		-- 								string.format('PRETTIERD_DEFAULT_CONFIG=%s', vim.fn.expand('~/.config/nvim/utils/linter-config/.prettierrc.json')),
		-- 							},
		-- 						},
		-- 						eslint = {
		-- 								lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
		-- 								lintStdin = true,
		-- 								lintFormats = {"%f:%l:%c: %m"},
		-- 								lintIgnoreExitCode = true,
		-- 								formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
		-- 								formatStdin = true
		-- 						},
		-- 				}
		-- 		}
		-- }

		require('lspconfig').svelte.setup({
			filetypes = { "svelte", "html" }
		});

		require('lspconfig').rust_analyzer.setup({
			settings = {
				['rust_analyzer'] = {
					cargo = {
						allFeatures = true,
					}
				}
			}
		})

		require('lspconfig').gopls.setup({})

		require('lspconfig').zls.setup({})

		require('lspconfig').clangd.setup({})
		
		-- require('lspconfig').jdtls.setup({cmd = { 'jdtls' }})

		require('lspconfig').intelephense.setup({})

		require('lspconfig').jedi_language_server.setup{}

		-- require('lspconfig').eslint_d.setup{}

		-- require('lspconfig').astro.setup{}
		-- require('lspconfig').clangd.setup{}
		-- require('lspconfig').codelldb.setup{}

		-- Python
		-- require('lspconfig').pyright.setup{}
		-- require('lspconfig').ruff_lsp.setup{}

		vim.api.nvim_create_user_command(
				'Lsp',
				function(input)
						if input.args == '' then
								return
						end
						require('plugins.lsp.server').start(input.args, {})
				end,
				{desc = 'Initialize a language server', nargs = '?'}
		)
end

function user.diagnostics()
		local augroup = vim.api.nvim_create_augroup
		local autocmd = vim.api.nvim_create_autocmd

		local sign = function(opts)
				vim.fn.sign_define(opts.name, {
						texthl = opts.name,
						text = opts.text,
						numhl = '',
				})
		end

		sign({name = 'DiagnosticSignError', text = '✘'})
		sign({name = 'DiagnosticSignWarn', text = '▲'})
		sign({name = 'DiagnosticSignHint', text = '⚑'})
		sign({name = 'DiagnosticSignInfo', text = '»'})

		vim.diagnostic.config({
				virtual_text = false,
				signs = true,
				update_in_insert = false,
				underline = true,
				severity_sort = true,
				float = {
						focusable = false,
						style = 'minimal',
						border = 'rounded',
						source = 'always',
						header = '',
						prefix = '',
				},
		})

		local group = augroup('diagnostic_cmds', {clear = true})

		autocmd('ModeChanged', {
				group = group,
				pattern = {'n:i', 'v:s'},
				desc = 'Disable diagnostics while typing',
				callback = function() vim.diagnostic.disable(0) end
		})

		autocmd('ModeChanged', {
				group = group,
				pattern = 'i:n',
				desc = 'Enable diagnostics when leaving insert mode',
				callback = function() vim.diagnostic.enable(0) end
		})
end

function user.handlers()
		local augroup = vim.api.nvim_create_augroup
		local autocmd = vim.api.nvim_create_autocmd

		vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
				vim.lsp.handlers.hover,
				{border = 'rounded'}
		)

		vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
				vim.lsp.handlers.signature_help,
				{border = 'rounded'}
		)

		local group = augroup('lsp_cmds', {clear = true})
		autocmd('LspAttach', {group = group, callback = user.lsp_attach})
end

function user.lsp_attach()
		if vim.b.lsp_attached then
				return
		end

		vim.b.lsp_attached = true

		local telescope = require('telescope.builtin')
		local lsp = vim.lsp.buf
		local bind = vim.keymap.set
		local command = vim.api.nvim_buf_create_user_command

		command(0, 'LspFormat', function()
				vim.lsp.buf.format({async = true})
		end, {})

		local opts = {silent = true, buffer = true}

		if vim.fn.mapcheck('gq', 'n') == '' then
				bind({'n', 'x'}, 'gq', '<cmd>LspFormat<cr>', opts)
		end

		bind('n', 'K', lsp.hover, opts)
		bind('n', 'gd', lsp.definition, opts)
		bind('n', 'gD', lsp.declaration, opts)
		bind('n', 'gi', lsp.implementation, opts)
		bind('n', 'go', lsp.type_definition, opts)
		bind('n', 'gr', lsp.references, opts)
		bind('n', 'gs', lsp.signature_help, opts)
		bind('n', '<leader>r', lsp.rename, opts)
		bind('n', '<F4>', lsp.code_action, opts)

		bind('n', 'gl', vim.diagnostic.open_float, opts)
		bind('n', '[d', vim.diagnostic.goto_prev, opts)
		bind('n', ']d', vim.diagnostic.goto_next, opts)

		bind('n', '<leader>fd', telescope.lsp_document_symbols, opts)
		bind('n', '<leader>fq', telescope.lsp_workspace_symbols, opts)
end

return Plugin
