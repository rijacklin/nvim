return {
		"nvim-tree/nvim-tree.lua",
		version = "*",
		tag = "nightly",
		dependencies = {
				"nvim-tree/nvim-web-devicons",
		},
		config = function()
				require("nvim-tree").setup {}

				-- Toggle nvim-tree
				vim.keymap.set('n', '<C-n>', '<cmd> :NvimTreeToggle<CR>')
		end,
}
