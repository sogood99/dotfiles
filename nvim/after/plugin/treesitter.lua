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
