local lsp_zero = require('lsp-zero')
local lspconfig = require('lspconfig')

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    mapping = cmp.mapping.preset.insert({
        -- `Enter` key to confirm completion
        ['<C-l>'] = cmp.mapping.confirm({ select = true }),
        -- behavior = cmp.ConfirmBehavior.Replace }),

        -- Ctrl+Space to trigger completion menu
        ['<C-Space>'] = cmp.mapping.complete(),

        -- Navigate between snippet placeholder
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),

        -- Scroll up and down in the completion documentation
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),

        -- supertab
        ['<Tab>'] = cmp_action.luasnip_jump_forward(),
        ['<S-Tab>'] = cmp_action.luasnip_jump_backward()
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },     -- For vsnip users.
        -- { name = 'luasnip' },   -- For luasnip users.
        { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' },     -- For snippy users.
    }, {
        { name = 'buffer' },
    })
})

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr, remap = false })

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "H", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp_zero.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        ['tsserver'] = { 'javascript', 'typescript' },
        ['rust_analyzer'] = { 'rust' },
        ['lua_ls'] = { 'lua' },
        ['clangd'] = { 'c', 'cpp' },
        ['jdtls'] = { 'java' },
        ['efm'] = { 'python', 'tex' },
    }
})

lspconfig.clangd.setup({})
lspconfig.rust_analyzer.setup({})
lspconfig.lua_ls.setup({})
lspconfig.marksman.setup({})
lspconfig.texlab.setup({})
lspconfig.jdtls.setup {
    cmd = { 'jdt-language-server', "-configuration", "~/.cache/jdtls/config", "-data", "~/.cache/jdtls/workspace" },
}
lspconfig.pyright.setup({})
lspconfig.efm.setup({
    init_options = { documentFormatting = true },
    settings = {
        rootMarkers = { ".git/" },
        languages = {
            python = {
                { formatCommand = "black --quiet -", formatStdin = true }
            },
            tex = {
                { formatCommand = "latexindent", formatStdin = true }
            }
        }
    },
    filetypes = { 'python', 'tex' }
})
