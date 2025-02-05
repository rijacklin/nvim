return {
		'nvim-lualine/lualine.nvim',
		dependencies = {
				'nvim-tree/nvim-web-devicons', opt = true
		},
		config = function()
				require('lualine').setup({
						options = {
								theme = "gruvbox",
								-- theme = "kanagawa",
								-- theme = "sonokai",
								-- theme = "tokyonight",
								-- theme = "catppuccin",
						}
				})
		end
}
