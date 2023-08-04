local fn = vim.fn
local cmd = vim.cmd

-- bootstrap Packer
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    -- packer package manager
    use {'wbthomason/packer.nvim', opt = true}

    -- autocompletion
    use {'hrsh7th/nvim-cmp',
        config = function () require('plugins.cmp') end
    }
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'saadparwaiz1/cmp_luasnip'
    use {
        'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup {} end
    }

    -- which-key
    use {
      'folke/which-key.nvim',
      config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        require('which-key').setup {} end
}
    -- file structure
    use 'liuchengxu/vista.vim'

    -- snippets
    use 'L3MON4D3/LuaSnip' --snippet engine

    -- lsp
    use {
        'neovim/nvim-lspconfig',
        config = function () require('plugins.lsp_config') end
    }

    -- c/c++ syntax highlighting
    use 'bfrg/vim-cpp-modern'

    -- latex syntax highlighting
    use 'lervag/vimtex'

    -- glsl syntax highlighting
    use 'tikhomirov/vim-glsl'

    -- lualine status bar
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config = function() require('plugins.lualine') end
    }

    -- terminal
    use {
        'akinsho/toggleterm.nvim',
        tag = '*',
        config = function () require('plugins.toggleterm') end
    }

    -- telescope fuzzy finder
    use {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        requires = {'nvim-lua/plenary.nvim'}
    }
    use {
        'nvim-telescope/telescope-file-browser.nvim',
        config = function () require('plugins.telescope_file_browser') end
    }

    use {
        'goolord/alpha-nvim',
        config = function ()
            require'alpha'.setup(require('alpha.themes.dashboard').config)
        end
    }

    use {
        'iamcco/markdown-preview.nvim',
        run = function() vim.fn['mkdp#util#install']() end
    }

    -- colorschemes
    use {
        'folke/tokyonight.nvim',
        config = function() require('plugins.tokyonight') end
    }

    use {
        'ellisonleao/gruvbox.nvim',
        config = function() require('plugins.gruvbox') end
    }

    use {
        'rose-pine/neovim',
        config = function() require('plugins.rose-pine') end
    }

    if packer_bootstrap then
        require('packer').sync()
    end
end)
