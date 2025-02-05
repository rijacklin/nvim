return {
		-- 'luisiacc/gruvbox-baby',
		-- config = function()
		-- 		-- Example config in Lua
		-- 		vim.g.gruvbox_baby_function_style = "NONE"
		-- 		vim.g.gruvbox_baby_keyword_style = "italic"
		--
		-- 		-- Each highlight group must follow the structure:
		-- 		ColorGroup = {fg = "foreground color", bg = "background_color", style = "some_style(:h attr-list)"}
		-- 		-- See also :h highlight-guifg
		-- 		-- Example:
		-- 		vim.g.gruvbox_baby_highlights = {Normal = {fg = "#458588", bg = "NONE", style="underline"}}
		--
		-- 		-- Enable telescope theme
		-- 		vim.g.gruvbox_baby_telescope_theme = 1
		--
		-- 		-- Enable transparent mode
		-- 		vim.g.gruvbox_baby_transparent_mode = 1
		--
		-- 		-- Load the colorscheme
		-- 		vim.cmd[[colorscheme gruvbox-baby]]
		-- end

		-- 'projekt0n/github-nvim-theme',
		-- priority = 1000, -- make sure to load this before all the other start plugins
		-- config = function()
		-- 	require('github-theme').setup({
		-- 		options = {
		-- 			transparent = false,
		-- 		}
		-- 	})
		--
		-- 	vim.cmd('colorscheme github_light')
		-- end,

		-- "catppuccin/nvim",
		-- -- { name = "catppuccin", priority = 1000 },
		-- config = function ()
		-- 		require("catppuccin").setup({
		-- 				-- flavour = "latte",
		-- 				-- flavour = "frappe",
		-- 				-- flavour = "macchiato",
		-- 				flavour = "mocha",
		-- 				-- transparent_background = true,
		-- 				integrations = {
		-- 						cmp = true,
		-- 						nvimtree = true,
		-- 						treesitter = true,
		-- 				}
		-- 		})
		-- 		vim.cmd[[colorscheme catppuccin]]
		-- end

		-- "folke/tokyonight.nvim",
		-- lazy = false,
		-- config = function()
		-- 	-- vim.cmd[[colorscheme tokyonight]]
		-- end

		-- 'sainnhe/sonokai',
		-- lazy = false,
		-- config = function()
		-- 	vim.cmd[[colorscheme sonokai]]
		-- end

		'rose-pine/neovim',
		-- { name = "rose-pine" },
		config = function()
			require("rose-pine").setup({
				variant = "auto", -- auto, main, moon, or dawn
				dark_variant = "main", -- main, moon, or dawn
				dim_inactive_windows = false,
				extend_background_behind_borders = true,

				enable = {
					terminal = true,
					legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
					migrations = true, -- Handle deprecated options automatically
				},

				styles = {
					bold = true,
					italic = true,
					transparency = false,
				},

				groups = {
					border = "muted",
					link = "iris",
					panel = "surface",

					error = "love",
					hint = "iris",
					info = "foam",
					note = "pine",
					todo = "rose",
					warn = "gold",

					git_add = "foam",
					git_change = "rose",
					git_delete = "love",
					git_dirty = "rose",
					git_ignore = "muted",
					git_merge = "iris",
					git_rename = "pine",
					git_stage = "iris",
					git_text = "rose",
					git_untracked = "subtle",

					h1 = "iris",
					h2 = "foam",
					h3 = "rose",
					h4 = "gold",
					h5 = "pine",
					h6 = "foam",
				},

				palette = {
					-- Override the builtin palette per variant
					-- moon = {
					--     base = '#18191a',
					--     overlay = '#363738',
					-- },
				},

				highlight_groups = {
					-- Comment = { fg = "foam" },
					-- VertSplit = { fg = "muted", bg = "muted" },
				},

				before_highlight = function(group, highlight, palette)
					-- Disable all undercurls
					-- if highlight.undercurl then
					--     highlight.undercurl = false
					-- end
					--
					-- Change palette colour
					-- if highlight.fg == palette.pine then
					--     highlight.fg = palette.foam
					-- end
				end,
			})

			-- vim.cmd[[colorscheme rose-pine]]
			vim.cmd[[colorscheme rose-pine-main]]
			-- vim.cmd[[colorscheme rose-pine-moon]]
			-- vim.cmd[[colorscheme rose-pine-dawn]]
		end

		-- 'rebelot/kanagawa.nvim',
		-- lazy = false,
		-- config = function()
		-- 	vim.cmd[[colorscheme kanagawa]]
		-- end

		-- 'arzg/vim-colors-xcode',
		-- config = function()
		-- 		vim.cmd[[colorscheme xcode]]
		-- 		vim.cmd[[colorscheme xcodehc]]
		-- 		vim.cmd[[colorscheme xcodewwdc]]
		-- end
}
