-- Global Options
vim.g.mapleader = " "
-- vim.cmd([[ let localmapleader = " " ]])

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.breakindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.g.noexpandtab = true
vim.opt.colorcolumn = "80"

-- Set line wrapping before edge
vim.opt.linebreak = true
vim.opt.wrap = true
vim.opt.textwidth = 80
vim.g.nolist = true

-- zig/zls
vim.g.zig_fmt_autosave = 0

-- Transparent nvim
vim.g.transparent_groups = vim.list_extend(vim.g.transparent_groups or {}, { "Pmenu", "Float", "NormalFloat" })

-- Transparency
vim.cmd([[ au ColorScheme * hi Normal gui=none ]])

-- Disable new line comment continuation
-- vim.cmd([[ autocmd BufNewFile,BufRead * setlocal formatoptions-=cro ]])

-- vim.cmd([[
-- 		autocmd BufRead,BufEnter *.astro set filetype=astro
-- ]])

-- vim.cmd([[ augroup filetype
--   au! BufRead,BufNewFile *.swift set ft=swift
-- augroup END
-- ]])

-- JDTLS
-- vim.cmd [[
-- augroup jdtls_lsp
--     autocmd!
--     autocmd FileType java lua require'jdtls.jdtls_setup'.setup()
-- augroup end
-- ]]

-- JDTLS
vim.cmd [[
augroup jdtls_lsp
    autocmd!
    autocmd FileType java lua require'jdtls.setup'
augroup end
]]

-- Fixed svelte file html syntax highlighting
-- vim.cmd [[
-- au BuffReadPost *.svelte set syntax=html
-- ]]

vim.api.nvim_create_autocmd("FileType", {
    pattern = {"tex", "markdown", "html"},
    callback = function()
		vim.opt_local.textwidth = 0
    	vim.opt_local.colorcolumn = ""
    end
})
