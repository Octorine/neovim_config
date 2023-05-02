-- The following adapted from the lspconfig github readme example
--
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
k = require("keys")

k.set_key_lua('n', '<space>e', "vim.diagnostic.open_float()", "Open float containing current diiagnostic")
k.set_key_lua('n', '[d', "vim.diagnostic.goto_prev()", 'Go to next diagnostic')
k.set_key_lua('n', ']d', "vim.diagnostic.goto_next()", 'Go to previous diagnostic')
k.set_key_lua('n', '<space>q', "vim.diagnostic.setloclist()", 'Open list of diagnostics')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    --
    -- Format on save
    vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()]]
    
    --  local bufopts = { noremap=true, silent=true, buffer=bufnr }
    local bufopts = { noremap=true, silent=true}
    
    -- Helper Function for setting keymaps
    
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    k.set_key_lua('n', 'gD',          "vim.lsp.buf.declaration()", 'Go to declaration')
    k.set_key_lua('n', 'gd',          "vim.lsp.buf.definition()", 'Go to definition')
    k.set_key_lua('n', '<F12>',       "vim.lsp.buf.definition()", 'Go to definition')
    k.set_key_lua('n', 'K',           "vim.lsp.buf.hover()", 'Hover')
    k.set_key_lua('n', 'gi',          "vim.lsp.buf.implementation()", 'Go to implementation')
    k.set_key_lua('n', '<space>D',    "vim.lsp.buf.type_definition()", 'Go to type definition')
    k.set_key_lua('n', '<space>rn',   "vim.lsp.buf.rename()", 'Rename')
    k.set_key_lua('n', '<F2>',        "vim.lsp.buf.rename()", 'Rename')
    k.set_key_lua('n', '<space>ca',   "vim.lsp.buf.code_action()", 'Code Actions')
    k.set_key_lua('n', 'gr',          "vim.lsp.buf.references()", 'Show References')
    k.set_key_lua('n', '<space>f',    "vim.lsp.buf.formatting()", 'Format buffer')
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'rust_analyzer',  'hls'}

for _, lsp in pairs(servers) do
    require('lspconfig')[lsp].setup {
        on_attach = on_attach,
        flags = {
            -- This will be the default in neovim 0.7+
            debounce_text_changes = 150,
        }
    }
end
