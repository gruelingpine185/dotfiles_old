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
    use {"wbthomason/packer.nvim", opt = true}

    -- lualine status bar
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config = function() require('plugins.lualine') end
    }

    -- telescope fuzzy finder
    use {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        requires = {'nvim-lua/plenary.nvim'}
    }

    use {
        'goolord/alpha-nvim',
        config = function ()
            require'alpha'.setup(require('alpha.themes.dashboard').config)
        end
    }

    -- colorschemes
    use 'ellisonleao/gruvbox.nvim'
    use {
        'folke/tokyonight.nvim',
        config = function() require('plugins.tokyonight') end
    }

    if packer_bootstrap then
        require('packer').sync()
    end
end)