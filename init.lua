-- Try to load "env" file
local ok, env = pcall(require, 'user.env')

if not ok then
  local msg = 'lua/user/env.lua not found. You should probably rename env.sample'
  vim.notify(msg, vim.log.levels.ERROR)
  return
end

require('user.settings')
require('user.lazy')
require('user.options')
require('user.keymaps')

-- Transparent nvim
-- vim.g.transparent_groups = vim.list_extend(vim.g.transparent_groups or {}, { "Pmenu", "Float", "NormalFloat" })

vim.cmd[[ filetype plugin indent on ]]
vim.cmd[[ syntax enable ]]
vim.cmd[[ let g:vimtex_view_general_viewer = 'zathura' ]]
-- vim.cmd[[ let g:vimtex_view_zathura_options = '-reuse-instance' ]]
vim.cmd[[ let g:vimtex_compiler_method = 'latexmk' ]]
vim.cmd[[ let g:tex_flavor = 'latex' ]]

-- NVIM Dap Configurations
local dap = require("dap")

-- dap.adapters.lldb = {
-- 		type = 'executable',
-- 		command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
-- 		name = 'lldb'
-- }
dap.adapters.codelldb = {
		type = 'server',
		port = "${port}",
		executable = {
				-- Change this to your path!
				command = '/Users/richard/Sources/lldb/extension/adapter/codelldb',
				args = {"--port", "${port}"},
		}
}

dap.configurations.rust = {
		{
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				program = function()
						return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				end,
				cwd = '${workspaceFolder}',
				stopOnEntry = false,
		},

		-- initCommands = function()
		-- 		-- Find out where to look for the pretty printer Python module
		-- 		local rustc_sysroot = vim.fn.trim(vim.fn.system('rustc --print sysroot'))
		--
		-- 		local script_import = 'command script import "' .. rustc_sysroot .. '/lib/rustlib/etc/lldb_lookup.py"'
		-- 		local commands_file = rustc_sysroot .. '/lib/rustlib/etc/lldb_commands'
		--
		-- 		local commands = {}
		-- 		local file = io.open(commands_file, 'r')
		-- 		if file then
		-- 				for line in file:lines() do
		-- 						table.insert(commands, line)
		-- 				end
		-- 				file:close()
		-- 		end
		-- 		table.insert(commands, 1, script_import)
		--
		-- 		return commands
		-- end,
}

-- vim.cmd[[
-- 		function! s:TexFocusVim() abort
-- 			silent execute "!open -a iTerm"
-- 			redraw!
-- 		endfunction
-- ]]
--
-- vim.cmd[[
-- 		augroup vimtex_event_focus
-- 			au!
-- 			au User VimtexEventViewReverse call s:TexFocusVim()
-- 		augroup END
-- ]]
