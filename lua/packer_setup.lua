local use = require('packer').use
require('packer').startup(function()

    use 'wbthomason/packer.nvim' -- Package manager
    use 'habamax/vim-godot'
    use {'neovim/nvim-lspconfig', -- Collection of configurations for the built-in LSP client
        tag = 'v0.1.0'
    }
    use {
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons"},
        event = 'VimEnter',
        config = require'lualine_setup'
    }
    use 'folke/tokyonight.nvim'
    use 'mfussenegger/nvim-dap'
    use 'arkav/lualine-lsp-progress'
end)

