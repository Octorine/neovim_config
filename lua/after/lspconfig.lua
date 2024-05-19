
-- The following adapted from the lspconfig github readme example
--
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.lsp.set_log_level("debug")

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float,{desc = "Open diagnostics"})
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev,{desc = "Go to previous diagnostic"})
vim.keymap.set('n', ']d', vim.diagnostic.goto_next,{desc = "Go to next diagnostic"})
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist,{desc = "Diagnostics picklist"})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    --
    -- Format on save
    vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
    
    --  local bufopts = { noremap=true, silent=true, buffer=bufnr }
    local bufopts = { noremap=true, silent=true}
    
    -- Helper Function for setting keymaps
    
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.keymap.set('n', 'gD',          vim.lsp.buf.declaration, {desc = 'Go to declaration'})
    vim.keymap.set('n', 'gd',          vim.lsp.buf.definition, {desc = 'Go to definition'})
    vim.keymap.set('n', '<F12>',       vim.lsp.buf.definition, {desc = 'Go to definition'})
    vim.keymap.set('n', 'K',           vim.lsp.buf.hover, {desc = 'Hover'})
    vim.keymap.set('n', 'gi',          vim.lsp.buf.implementation, {desc = 'Go to implementation'})
    vim.keymap.set('n', '<space>D',    vim.lsp.buf.type_definition, {desc = 'Go to type definition'})
    vim.keymap.set('n', '<space>rn',   vim.lsp.buf.rename, {desc = 'Rename'})
    vim.keymap.set('n', '<F2>',        vim.lsp.buf.rename, {desc = 'Rename'})
    vim.keymap.set('n', '<space>ca',   vim.lsp.buf.code_action, {desc = 'Code Actions'})
    vim.keymap.set('n', 'gr',          vim.lsp.buf.references,{desc =  'Show References'})
    vim.keymap.set('n', '<space>f',    vim.lsp.buf.format,{desc =  'Format buffer'})
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
