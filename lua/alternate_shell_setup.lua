-- Some keybinds to switch back and forth between the editor and a terminal.
local k = require'keys'

k.set_key('n', '<Leader>as', '<C-w><C-w>GA', 'From normal mode, jump to the other buffer containing the terminal.') 
k.set_key('t', '<C-g><C-g>', '<C-\\><C-n><C-w><C-w>', 'Exit the terminal and jump to the other buffer.') 

