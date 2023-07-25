require('toggleterm').setup({
    function(term)
        if term.direction == 'horizontal' then
            return 40
        elseif term.direction == 'vertical' then
            return vim.o.columns * 0.6
        end
    end,
    open_mapping = [[<c-\>]],
    -- on_create = fun(t: Terminal),
    -- on_open = fun(t: Terminal),
    -- on_close = fun(t: Terminal),
    -- on_stdout = fun(t: Terminal, job: number, data: string[], name: string)
    -- on_stderr = fun(t: Terminal, job: number, data: string[], name: string)
    -- on_exit = fun(t: Terminal, job: number, exit_code: number, name: string)
    hide_numbers = true,
    shade_filetypes = {},
    autochdir = false,
    shade_terminals = false,
    close_on_exit = true,
    vim.o.shell,
    auto_scroll = true,
    start_in_insert = true,
    insert_mappings = true, -- whether or not the open mapping applies in insert mode
    terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
    persist_size = true,
    persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
    direction = 'vertical' -- | 'horizontal'
})
