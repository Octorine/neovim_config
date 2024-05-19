return  {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons"},
    event = 'VimEnter',
    config = require'after.lualine'
}

