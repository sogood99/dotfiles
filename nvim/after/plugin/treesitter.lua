require('nvim-treesitter').setup {
    install_dir = vim.fn.stdpath('data') .. '/site',
}

require('nvim-treesitter').install {
    'c', 'lua', 'vim', 'vimdoc', 'query', 'python', "markdown"
}

vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'python', 'lua', 'c' },
    callback = function()
        vim.treesitter.start()
    end,
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'python' },
    callback = function()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'python' },
    callback = function()
        vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.wo[0][0].foldmethod = 'expr'
    end,
})

require('nvim-treesitter-textobjects').setup {
    select = {
        lookahead = true,
        selection_modes = {
            ['@parameter.outer'] = 'v',
            ['@function.outer'] = 'V',
            ['@class.outer'] = '<c-v>',
        },
        include_surrounding_whitespace = true,
    },
    move = {
        set_jumps = true,
    },
}

-- Select
local select = require('nvim-treesitter-textobjects.select')
vim.keymap.set({ 'x', 'o' }, 'af', function() select.select_textobject('@function.outer', 'textobjects') end)
vim.keymap.set({ 'x', 'o' }, 'if', function() select.select_textobject('@function.inner', 'textobjects') end)
vim.keymap.set({ 'x', 'o' }, 'ac', function() select.select_textobject('@class.outer', 'textobjects') end)
vim.keymap.set({ 'x', 'o' }, 'ic', function() select.select_textobject('@class.inner', 'textobjects') end)

-- Swap
local swap = require('nvim-treesitter-textobjects.swap')
vim.keymap.set('n', '<leader>w', function() swap.swap_next('@parameter.inner') end)
vim.keymap.set('n', '<leader>b', function() swap.swap_previous('@parameter.inner') end)

-- Move
local move = require('nvim-treesitter-textobjects.move')
vim.keymap.set({ 'n', 'x', 'o' }, ']f', function() move.goto_next_start('@function.outer', 'textobjects') end)
vim.keymap.set({ 'n', 'x', 'o' }, ']c', function() move.goto_next_start('@class.outer', 'textobjects') end)
vim.keymap.set({ 'n', 'x', 'o' }, ']F', function() move.goto_next_end('@function.outer', 'textobjects') end)
vim.keymap.set({ 'n', 'x', 'o' }, ']C', function() move.goto_next_end('@class.outer', 'textobjects') end)
vim.keymap.set({ 'n', 'x', 'o' }, '[f', function() move.goto_previous_start('@function.outer', 'textobjects') end)
vim.keymap.set({ 'n', 'x', 'o' }, '[c', function() move.goto_previous_start('@class.outer', 'textobjects') end)
vim.keymap.set({ 'n', 'x', 'o' }, '[F', function() move.goto_previous_end('@function.outer', 'textobjects') end)
vim.keymap.set({ 'n', 'x', 'o' }, '[C', function() move.goto_previous_end('@class.outer', 'textobjects') end)
