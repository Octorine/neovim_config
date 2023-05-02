-- set up the dap
local dap = require('dap')

-- set up the adapter for lldb
dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    command = '/home/james/.vscode/extensions/vadimcn.vscode-lldb-1.8.1/adapter/codelldb',
    args = {"--port", "${port}"},

    -- On windows you may have to uncomment this:
    -- detached = false,
  }
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}

-- use the same configuration for c/c++/rust
dap.configurations.c = dap.configurations.cpp

dap.configurations.rust = dap.configurations.cpp



----------------------------------------------------------------------
-- Keybinds
----------------------------------------------------------------------

local k = require'keys'

k.set_key_lua('n', '<leader>dp', "require'dap'.continue()", 'Continue')
k.set_key_lua('n', '<leader>do', "require'dap'.step_over()", 'Step Over')
k.set_key_lua('n', '<leader>di', "require'dap'.step_into()", 'Step Into')
k.set_key_lua('n', '<F12>', "require'dap'.step_out()", 'Step out')
k.set_key_lua('n', '<Leader>b', 
    "require'dap'.toggle_breakpoint()", 'Tobble Breakpoint')
k.set_key_lua('n', '<Leader>B', 
    "require'dap'.set_breakpoint()", 'Set breakpoint')
k.set_key_lua('n', '<Leader>lp', 
    "lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))", 
    'Set breakpoint with log')
k.set_key_lua('n', '<Leader>dr', "require('dap').repl.open()", 'Open REPL')
k.set_key_lua('n', '<Leader>dl', "require'dap'.run_last()", 'Runlast')
k.set_key_lua( 'v', '<Leader>dh', "require('dap.ui.widgets').hover()", 'Hover')
k.set_key_lua('n', '<Leader>dh', "require('dap.ui.widgets').hover()", 'Hover')
k.set_key_lua('n', '<Leader>dp', "require('dap.ui.widgets').preview()", 'Preview')
k.set_key_lua('v', '<Leader>dp', "require('dap.ui.widgets').preview()", 'Preview')
k.set_key_lua('n', '<Leader>df', 
    "local widgets = require('dap.ui.widgets') widgets.centered_float(widgets.frames)", 
    'Show frames')
k.set_key_lua('n', '<Leader>ds', 
    "local widgets = require('dap.ui.widgets') widgets.centered_float(widgets.scopes)", 
    'Show scopes')
