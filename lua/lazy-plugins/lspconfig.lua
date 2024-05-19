
    return {'neovim/nvim-lspconfig', -- Collection of configurations for the built-in LSP client
        tag = 'v0.1.0',
        config = function()
            require'after.lspconfig'
        end
    }
