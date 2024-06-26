require "sets"
require "keys"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require "lazy".setup("lazy-plugins")

vim.api.nvim_create_user_command('Config', 
    function() vim.cmd.edit("~/.config/nvim/init.lua")
    end, {})
