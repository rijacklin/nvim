return {
		'nvim-treesitter/nvim-treesitter',
		config = function()
				-- Treesitter Plugin Setup 
				vim.treesitter.language.register('astro', 'tsx', 'jsx')
				require('nvim-treesitter.configs').setup {
						ensure_installed = {
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
						ident = {
							enable = true,
							disable = {},
						}, 
						rainbow = {
								enable = true,
								extended_mode = true,
								max_file_lines = nil,
						}
				}

				local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
				parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
		end,
}
