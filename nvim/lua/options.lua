local opts = {noremap = true, silent = true}
local term_opts = {silent = true}
local keymap = vim.api.nvim_set_keymap

local o = vim.opt
local g = vim.g


g.mapleader = ';'
g.vimtex_view_method = 'zathura'

-- Zatuhra
keymap('n', '<leader>v', ':VimtexView<CR>', opts)

vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')

o.number = true
