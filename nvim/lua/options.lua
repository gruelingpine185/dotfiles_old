local ts_builtin = require('telescope.builtin')
local ts_file_browser = require('telescope').extensions.file_browser

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


-- Luasnip


-- Vista
keymap('n', '<leader>ft', '<cmd>Vista nvim_lsp<CR>', opts)
keymap('n', '<leader>t', '<cmd>Vista!!<CR>', opts)
keymap('n', '<leader><S-t>', '<cmd>Vista!<CR>', opts)

-- Telescope
vim.keymap.set('n', '<leader>ff', ts_builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', ts_builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', ts_builtin.buffers, {})
vim.keymap.set('n', '<leader>fe', ts_file_browser.file_browser, {})

-- LSP
keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Zatuhra
keymap('n', '<leader>v', ':VimtexView<CR>', opts)

-- buffers
keymap('n', '<S-l>', ':bNext<CR>', opts)
keymap('n', '<S-h>', ':bprevious<CR>', opts)

-- terminal
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)

-- move text
keymap("n", "<M-UP>", ":m-2<CR>==", opts)
keymap("n", "<M-DOWN>", ":m+1<CR>==", opts)

vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')

vim.api.nvim_exec([[ au BufNewFile,BufReadPost   *.shader,*.frag,*.vert,*.fp,*.vp,*.glsl   setf glsl ]], false)
