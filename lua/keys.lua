-- some convenience functions for setting keymaps

local keys = {}

function keys.set_key (mode, keys, actions, desc)
    local options = {noremap=true, silent=true}
    --options.desc = desc
    vim.api.nvim_buf_set_keymap(0, mode, keys, actions, options)
end

function keys.set_key_lua (mode, keys, lua_stuff, desc)
    local options = {noremap=true, silent=true}
    --options.desc = desc
    vim.api.nvim_buf_set_keymap(0, mode, keys, ':lua ' .. lua_stuff .. '<CR>', options)
end
return keys
