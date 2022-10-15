local opts = {noremap = true, silent = true}
local term_opts = {silent = true}
local keymap = vim.api.nvim_set_keymap


local options = {
  backup = false,               -- creates a backup file
  clipboard = 'unnamedplus',    -- allows neovim to access the system clipboard
  mouse = 'a',                  -- allow mouse use
  smartcase = true,             -- smart case
  smartindent = true,           -- make indenting smarter again
  splitbelow = true,            -- force horizontal splits below current window
  splitright = true,            -- force vertical splits right of current window
  swapfile = false,             -- creates a swapfile
  writebackup = false,          -- dont' allow file already opened to be edited
  expandtab = true,             -- convert tabs to spaces
  shiftwidth = 4,               -- number of spaces inserted for each indentation
  tabstop = 4,                  -- insert 2 spaces for a tab
  number = true
}

local globals = {
  mapleader = ';',
  vimtex_view_method = 'zathura'
}


for k, v in pairs(options) do
  vim.opt[k] = v
end

for k,v in pairs(globals) do
  vim.g[k] = v
end


keymap('', '<ESC>', ':nohls<CR>', opts)

-- Zatuhra
keymap('n', '<leader>v', ':VimtexView<CR>', opts)

-- buffers
keymap('n', '<S-l>', ':bNext<CR>', opts)
keymap('n', '<S-h>', ':bprevious<CR>', opts)

-- move text
keymap("n", "<M-UP>", ":m-2<CR>==", opts)
keymap("n", "<M-DOWN>", ":m+1<CR>==", opts)

vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')
