return {
		-- 'arzg/vim-colors-xcode',
		-- config = function()
		-- 		vim.cmd[[colorscheme xcode]]
		-- 		vim.cmd[[colorscheme xcodehc]]
		-- 		vim.cmd[[colorscheme xcodewwdc]]
		-- end

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

		-- "catppuccin/nvim",
		-- -- { name = "catppuccin", priority = 1000 },
		-- config = function ()
		-- 		require("catppuccin").setup({
		-- 				flavour = "mocha",
		-- 				transparent_background = true,
		-- 				integrations = {
		-- 						cmp = true,
		-- 						nvimtree = true,
		-- 						treesitter = true,
		-- 				}
		-- 		})
		-- 		-- vim.cmd[[colorscheme catppuccin]]
		-- end

		-- "folke/tokyonight.nvim",
		-- lazy = false,
		-- config = function()
		-- 	-- vim.cmd[[colorscheme tokyonight]]
		-- end

		'sainnhe/sonokai',
		lazy = false,
		config = function()
			vim.cmd[[colorscheme sonokai]]
		end
}
