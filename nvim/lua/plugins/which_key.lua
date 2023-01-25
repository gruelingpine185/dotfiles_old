local wk = require('which-key')



wk.register({
    ['<leader>f'] = {name = '+file'},
    ['<leader>ff'] = {'<cmd>Telescope find_files<cr>', 'Find File'},
    ['<leader>fg'] = {'<cmd>Telescope live_grep<cr>', 'Live Grep'},
    ['<leader>fb'] = {'<cmd>Telescope buffers<cr>', 'Buffers'},
    ['<leader>ft'] = {'<cmd>Vista nvim_lsp<cr>', 'Open File Outline'},
    ['<leader>t'] = {'<cmd>Vista!!<cr>', 'Toggle File Outline'},
    ['<leader><S-t>'] = {'<cmd>Vista!<cr>', 'Close File Outline'},
    ['<leader>v'] = {'<cmd>VimtexView<cr>', 'Open Vimtex Viewer'},
    ['<S-l>'] = {'<cmd>bNext<cr>', 'Next Buffer'},
    ['<S-h>'] = {'<cmd>bprevious<cr>', 'Previous Buffer'},
    ['<M-UP'] = {'<cmd>m-2<cr>==', 'Move Text Up'},
    ['<M-DOWN'] = {'<cmd>m+1<cr>==', 'Move Text DOWN'},
})
