return {
		'jakewvincent/mkdnflow.nvim',
		 config = function()
				require('mkdnflow').setup({
						-- Config goes here; leave blank for defaults
						perspective = {
								priority = 'root',
								root_tell = 'index.md',
						},
				})
		 end,
}
