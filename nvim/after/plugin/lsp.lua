-- Import necessary modules
local lsp_zero = require('lsp-zero')
local lspconfig = require('lspconfig')
local cmp = require('cmp')
local luasnip = require("luasnip")
local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")

-- Setup nvim-cmp for autocompletion
cmp.setup({
    preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-l>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
            else
                cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                cmp_ultisnips_mappings.jump_backwards(fallback)
            end
        end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'ultisnips' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'buffer' },
    })
})

-- Extend lspconfig with lsp-zero
lsp_zero.extend_lspconfig({
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    lsp_attach = function(client, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr, remap = false })
        local opts = { buffer = bufnr }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "H", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
        vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "[g", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "]g", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
        vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
    end,
    float_border = 'rounded',
    sign_text = true,
})

-- Enable format on save
lsp_zero.format_on_save({
    format_opts = { async = false, timeout_ms = 10000 },
    servers = {
        ['tsserver'] = { 'javascript', 'typescript' },
        ['rust_analyzer'] = { 'rust' },
        ['lua_ls'] = { 'lua' },
        ['clangd'] = { 'c', 'cpp' },
        ['jdtls'] = { 'java' },
        ['gopls'] = { 'go' },
        ['zls'] = { 'zig' },
        ['efm'] = { 'python', 'tex', 'ocaml' },
    }
})

-- Setup language servers
lspconfig.clangd.setup({})
lspconfig.rust_analyzer.setup({
    settings = { ["rust-analyzer"] = { cargo = { cfgs = { kani = "" } } } }
})
lspconfig.lua_ls.setup({})
lspconfig.marksman.setup({})
lspconfig.texlab.setup({})
-- Uncomment and configure the Java language server as needed
-- lspconfig.jdtls.setup({
--     cmd = { 'jdtls', "-configuration", "~/.cache/jdtls/config", "-data", "~/.cache/jdtls/workspace" },
-- })
lspconfig.zls.setup({})
lspconfig.pyright.setup({})
lspconfig.efm.setup({
    init_options = { documentFormatting = true },
    settings = {
        rootMarkers = { ".git/" },
        languages = {
            python = { { formatCommand = "black --quiet -", formatStdin = true } },
            tex = { { formatCommand = "latexindent", formatStdin = true } },
            ocaml = { { formatCommand = "ocamlformat --enable-outside-detected-project --impl -", formatStdin = true } },
        }
    },
    filetypes = { 'python', 'tex', 'ocaml' }
})
lspconfig.ocamllsp.setup({})
lspconfig.gopls.setup({})
