vim.keymap.set('n', '<leader>f/', rd_root_cmd_wrapper(':FzfLua grep cwd={RD_ROOT}<CR>'), { desc = 'FzfLua grep' })
vim.keymap.set('n', '<leader>ff', rd_root_cmd_wrapper(':FzfLua files cwd={RD_ROOT}<CR>'), { desc = 'FzfLua files' })
vim.keymap.set('n', '<leader>fcw', rd_root_cmd_wrapper(':FzfLua grep_cword cwd={RD_ROOT}<CR>'), { desc = 'FzfLua grep_cword' })
vim.keymap.set('n', '<leader>fcW', rd_root_cmd_wrapper(':FzfLua grep_cWORD cwd={RD_ROOT}<CR>'), { desc = 'FzfLua grep_cWORD' })
vim.keymap.set('n', '<leader>fr', ':FzfLua resume<CR>', { desc = 'FzfLua resume' })

