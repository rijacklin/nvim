return {
		'nvim-treesitter/nvim-treesitter',
		config = function()
				-- Treesitter Plugin Setup 
				vim.treesitter.language.register('astro', 'tsx')
				require('nvim-treesitter.configs').setup {
						ensure_installed = {
								"astro",
								"bash",
								"css",
								"html",
								"latex",
								"lua",
								"python",
								"rust",
								"toml",
								"tsx",
								"typescript",
						},
						auto_install = true,
						autotag = {
								enable = true,
						},
						highlight = {
								enable = true,
								additional_vim_regex_highlighting=false,
						},
						ident = { enable = true }, 
						rainbow = {
								enable = true,
								extended_mode = true,
								max_file_lines = nil,
						}
				}
		end,
}
