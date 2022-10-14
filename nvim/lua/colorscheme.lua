vim.cmd [[
    try
        colorscheme gruvbox
    catch /^Vim\%((\a\+)\)\=:E185/
        try
            colorscheme tokyonight
        catch /^Vim\%((\a\+)\)\=:E185/
            colorscheme default
            set background=dark
        endtry
    endtry
]]

-- make neovim transparent
vim.cmd('highlight Normal guibg=none')
