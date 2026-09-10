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

vim.diagnostic.config({ virtual_lines = { current_line = true }, severity_sort = true })

local function diag_jmp(count)
    vim.diagnostic.jump({ count = count })
end


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
    vim.keymap.set("n", "[g", function() diag_jmp(-1) end, opts)
    vim.keymap.set("n", "]g", function() diag_jmp(1) end, opts)
    vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>a', vim.lsp.buf.rename, { desc = 'LSP rename' })
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end


vim.lsp.config("clangd", {
    filetypes = { "c", "cpp", "cuda" },
    on_attach = on_attach,
})

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            runtime = { version = "LuaJIT" },
            workspace = { checkThirdParty = false }
        }
    },
    on_attach = on_attach,
})

vim.lsp.config("rust_analyzer", {
    on_attach = on_attach,
})

vim.lsp.config("pyright", {
    on_attach = on_attach
})

vim.lsp.config("kotlin_lsp", {
    cmd = { 'kotlin-lsp', '--stdio' },
    filetypes = { 'kotlin', 'kt', 'kts' },
    on_attach = on_attach
})

vim.lsp.config("jtdls", {
    cmd = { 'jdtls' },
    filetypes = { 'java' },
    on_attach = on_attach
})

vim.lsp.config("vtsls", {
    cmd = { 'vtsls', '--stdio' },
    filetypes = { "typescipt" },
    on_attach = on_attach
})
