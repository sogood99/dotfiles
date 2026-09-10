local builtin = require('telescope.builtin')
pcall(require('telescope').load_extension, 'fzf')
vim.keymap.set('n', '<leader>gf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>gs', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
