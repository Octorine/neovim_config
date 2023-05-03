vim.o.ts=4
vim.o.sw=4
vim.o.expandtab = true
vim.o.signcolumn = 'yes'
vim.o.mouse = 'a'

vim.cmd('syntax on')
vim.cmd('colorscheme tokyonight')
vim.opt.formatoptions = vim.opt.formatoptions - 'r' - 'o';

require 'packer_setup'
require 'lsp_setup'
require 'dap_setup'
require 'alternate_shell_setup'
