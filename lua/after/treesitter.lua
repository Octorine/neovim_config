require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", 
	"javascript", 
	"typescript",
	"rust",
	"html" },
	sync_install = false,
	highlight = { enable = true },
	indent = { enable = true },  
})
