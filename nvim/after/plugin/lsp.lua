-- Load luasnip for snippet expansion
local luasnip = require("luasnip")

require("luasnip.loaders.from_lua").load({
    paths = { "~/dotfiles/nvim/snippets" }
})

-- Setup blink.nvim for completion
local cmp = require('blink.cmp')

cmp.setup({
    keymap = {
        preset = 'default',
        ['<C-l>'] = { 'select_and_accept' },
    },
    cmdline = {
        enabled = true,
    },
    completion = {
        menu = {
            border = "rounded",
        },
        documentation = {
            auto_show = true,
            window = {
                border = "rounded",
            },
        },
    },
    signature = {
        window = {
            border = 'rounded'
        }
    },
    snippets = {
        preset = "luasnip", -- Choose LuaSnip as the snippet engine
    },
    fuzzy = {
        sorts = {
            -- (optionally) always prioritize exact matches
            -- 'exact',

            -- pass a function for custom behavior
            -- function(item_a, item_b)
            --   return item_a.score > item_b.score
            -- end,

            'score',
            'sort_text',
        }
    }
})

-- format on save
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp", { clear = true }),
    callback = function(args)
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = args.buf,
            callback = function()
                vim.lsp.buf.format { async = false, id = args.data.client_id }
            end,
        })
    end
})

local function on_attach(client, bufnr)
    local opts = { buffer = bufnr }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "H", function()
        vim.lsp.buf.hover({
            border = "rounded",
        })
    end, opts)
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[g", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "]g", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end


vim.lsp.enable("clangd")
vim.lsp.config.clangd = {
    cmd = { "clangd" },
    filetypes = { 'cpp' },
    on_attach = on_attach,
}
vim.lsp.enable("luals")
vim.lsp.config.luals = {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { '.luarc.json', '.luarc.jsonc' },
    on_attach = on_attach,
}
vim.lsp.enable("rustls")
vim.lsp.config.rustls = {
    cmd = { 'rust-analyzer' },
    filetypes = { 'rust' },
    root_markers = { 'Cargo.toml' },
    on_attach = on_attach,
}
