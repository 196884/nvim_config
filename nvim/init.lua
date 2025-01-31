vim.opt.termguicolors = false

-- important to set it before loading the plugins
vim.g.mapleader = ","

-- tabs/indents
vim.o.tabstop     = 4
vim.o.shiftwidth  = 4
vim.o.shiftround  = true
vim.o.softtabstop = 4
vim.o.expandtab   = true

-- search behavior
vim.o.hlsearch   = false
vim.o.incsearch  = true
vim.o.ignorecase = true
vim.o.smartcase  = true

vim.o.matchpairs = "(:),{:},[:],<:>"
vim.o.showmatch  = true

vim.o.scrolloff  = 5
vim.g.nohidden   = true
vim.g.noswapfile = true

vim.keymap.set('n', '<leader>th', ':set hlsearch!<CR>', { desc = 'Toggle search highlighting' })
vim.keymap.set('n', '<leader>ln', ':set number!<CR>', { desc = 'Toggle line numbers' })

require("config.lazy")
require("fzf-lua")
require('lspconfig').clangd.setup({
    filetypes = { "cpp", "cc", "c", "h", "hpp", "hi", "proto" },
})
require('lspconfig').rust_analyzer.setup({})

-- colorscheme
require("nightfox").setup({})
vim.cmd.colorscheme("nightfox")

require('perso')
