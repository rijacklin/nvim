-- Keybindings
vim.keymap.set('n', '<leader>fs', '<cmd>update!<Cr>', {desc = 'Save'})

-- Copy & Paste to system clipboard
vim.keymap.set({'n', 'x'}, 'cp', '"+y')
vim.keymap.set({'n', 'x'}, 'cv', '"+p')

-- Delete text without changing registers
vim.keymap.set({'n', 'x'}, 'cv', '"+p')

-- Select all text in current buffer
vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>')

-- Leader
vim.keymap.set('n', '<Space>', '<Nop>', { silent = false, remap = false })

-- Exit
vim.keymap.set('n', '<leader>q', '<cmd> :q<CR>')

-- Window / split navigation
vim.keymap.set('n', '<C-H>', '<C-W><C-H>')
vim.keymap.set('n', '<C-J>', '<C-W><C-J>')
vim.keymap.set('n', '<C-K>', '<C-W><C-K>')
vim.keymap.set('n', '<C-L>', '<C-W><C-L>')

-- NvimTree
vim.keymap.set('n', '<C-A>', require('nvim-tree.api').fs.create)
vim.keymap.set('n', '<leader>v', require('nvim-tree.api').node.open.vertical)
vim.keymap.set('n', '<leader>s', require('nvim-tree.api').node.open.horizontal)

-- LSP
vim.keymap.set('n', 'K', '<cmd>:lua vim.lsp.buf.hover() <CR>')

-- Swap windows / splits
-- vim.keymap.set('n', '<C-R>', '<C-W><C-R>')

-- Vimtex View
-- vim.keymap.set('n', '<leader>vt', '<plug>:(vimtex-view)', { silent = false, remap = true })

-- Harpoon
-- vim.keymap.set('n', '<leader>yy', "<cmd>:lua require('harpoon.mark').add_file() <CR>")
-- vim.keymap.set('n', '<leader>yf', "<cmd>:lua require('harpoon.ui').toggle_quick_menu() <CR>")
-- vim.keymap.set('n', '<leader>yi', "<cmd>:lua require('harpoon.ui').nav_next() <CR>")
-- vim.keymap.set('n', '<leader>yo', "<cmd>:lua require('harpoon.ui').nav_prev() <CR>")
--
-- vim.keymap.set('n', '<leader>1', "<cmd>:lua require('harpoon.ui').nav_file(1) <CR>")
-- vim.keymap.set('n', '<leader>2', "<cmd>:lua require('harpoon.ui').nav_file(2) <CR>")
-- vim.keymap.set('n', '<leader>3', "<cmd>:lua require('harpoon.ui').nav_file(3) <CR>")
-- vim.keymap.set('n', '<leader>4', "<cmd>:lua require('harpoon.ui').nav_file(4) <CR>")
-- vim.keymap.set('n', '<leader>5', "<cmd>:lua require('harpoon.ui').nav_file(5) <CR>")
-- vim.keymap.set('n', '<leader>6', "<cmd>:lua require('harpoon.ui').nav_file(6) <CR>")

-- Nvim-Dap
vim.keymap.set('n', '<leader>dt', require('dap').toggle_breakpoint)
vim.keymap.set('n', '<leader>dc', require('dap').continue)
vim.keymap.set('n', '<leader>dso', require('dap').step_over)
vim.keymap.set('n', '<leader>dsi', require('dap').step_into)
vim.keymap.set('n', '<leader>dsu', require('dap').step_out)
vim.keymap.set('n', '<leader>dr', require('dap').repl.open)
vim.keymap.set('n', '<leader>du', require('dapui').toggle)
vim.keymap.set('n', '<leader>dss', ":lua require('dap').disconnect({ terminateDebuggee = true })<CR>")
vim.keymap.set('n', '<leader>dj', ":JdtUpdateDebugConfig<CR>")

-- Aerial
vim.keymap.set('n', '[', '<cmd>AerialPrev<CR>', { buffer = bufnr })
vim.keymap.set('n', ']', '<cmd>AerialNext<CR>', { buffer = bufnr })
vim.keymap.set('n', '<leader>ar', '<cmd>AerialToggle! left<CR>')
