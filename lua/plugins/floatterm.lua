return {
		"voldikss/vim-floaterm",
		-- FloaTerm configuration
		config = function()
				vim.keymap.set('n', "tt", ":FloatermToggle myfloat<CR>")
				vim.keymap.set('t', "<Esc>", "<C-\\><C-n>:q<CR>", { silent = true })
		end,
}
