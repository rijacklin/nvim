return {
	'nvim-treesitter/nvim-treesitter',
	config = function()
		-- Treesitter Plugin Setup 
		-- vim.treesitter.language.register('tsx', 'jsx')
		require('nvim-ts-autotag').setup {
			ensure_installed = {
					"c", "vim", "lua", "help",
					"css",
					"tsx",
					"typescript",
					"javascript",
					"svelte"
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

		local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
		parser_config.svelte = {
		  install_info = {
			url = "https://github.com/Himujjal/tree-sitter-svelte", -- adjust this URL if you have a different source
			files = {"src/parser.c", "src/scanner.cc"},
			branch = "main",
		  },
		  filetype = "svelte",
		}
	end,
}
