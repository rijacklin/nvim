return {
	'neovim/nvim-lspconfig',
	'simrat39/rust-tools.nvim',
	-- Debugging
	'nvim-lua/plenary.nvim',
	'mfussenegger/nvim-dap',
	config = function()
		local rt = require('rust-tools')

        rt.setup({
				server = {
					on_attach = function(_, bufnr)
						-- Hover actions
						-- vim.keymap.set("n", "<C-h>", rt.hover_actions.hover_actions, { buffer = bufnr })
						-- Code action groups
						vim.keymap.set("n", "<C-a>", rt.code_action_group.code_action_group, { buffer = bufnr })
					end,
				},
				tools = {
					hover_actions = {
						auto_focus = true,
					},
				},
				dap = {
					adapter = {
						type = "executable",
						command = "lldb-vscode",
						name = "rt_lldb",
					},
				},
			})
	end,
}
