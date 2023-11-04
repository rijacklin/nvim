return {
		'hrsh7th/nvim-cmp',
		event = "InsertEnter",
		dependencies = {
				'hrsh7th/cmp-path',
				'hrsh7th/cmp-nvim-lua',
				'hrsh7th/cmp-buffer',
				'hrsh7th/cmp-nvim-lsp',
				"L3MON4D3/LuaSnip",
				"onsails/lspkind-nvim",
		},
		config = function()
				local cmp = require("cmp")
				local lspkind = require("lspkind")

				-- Completion Plugin Setup
				cmp.setup({
					-- Enable LSP snippets
					snippet = {
						expand = function(args)
								require('luasnip').lsp_expand(args.body) 
						end,
					},
					mapping = {
						['<C-p>'] = cmp.mapping.select_prev_item(),
						['<C-n>'] = cmp.mapping.select_next_item(),
						-- Add tab support
						-- ['<S-Tab>'] = cmp.mapping.select_prev_item(),
						-- ['<Tab>'] = cmp.mapping.select_next_item(),
						['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
						['<C-f>'] = cmp.mapping.scroll_docs(4),
						['<C-Space>'] = cmp.mapping.complete(),
						['<C-e>'] = cmp.mapping.close(),
						['<CR>'] = cmp.mapping.confirm({
							behavior = cmp.ConfirmBehavior.Insert,
							select = true,
						})
					},
					-- Installed sources:
					sources = {
						{ name = 'path' },
						{ name = 'nvim_lsp', keyword_length = 3 },
						{ name = 'nvim_lsp_signature_help'},
						{ name = 'nvim_lua', keyword_length = 2},
						{ name = 'buffer', keyword_length = 2 },
						{ name = 'vsnip', keyword_length = 2 }, 
						{ name = 'calc'},
					},
					window = {
							completion = cmp.config.window.bordered(),
							documentation = cmp.config.window.bordered(),
					},
					formatting = {
							fields = {'menu', 'abbr', 'kind'},
							format = function(entry, item)
									local menu_icon ={
											nvim_lsp = 'λ',
											vsnip = '⋗',
											buffer = 'Ω',
											path = '🖫',
									}
									item.menu = menu_icon[entry.source.name]
									return item
							end,
					},
				})
		end,
}
