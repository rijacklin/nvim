return {
		"phaazon/hop.nvim",
		branch = 'v2',
		config = function()
				-- place this in one of your configuration file(s)
				local hop = require('hop').setup()
				local directions = require('hop.hint').HintDirection
				vim.keymap.set('n', '<leader>h', '<cmd>:HopWord <CR>')
		end
}
