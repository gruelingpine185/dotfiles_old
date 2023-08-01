require('plugins')
require('options')
require("luasnip.loaders.from_snipmate")
    .lazy_load({paths = "~/.config/nvim/snippets"})

vim.cmd('colorscheme rose-pine')

-- make neovim transparent
vim.cmd('highlight Normal guibg=none')
