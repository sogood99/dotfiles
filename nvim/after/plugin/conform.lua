local conform = require("conform")

conform.setup({
    formatters_by_ft = {
        python = { "black" },
        lua = { "stylua" }
    },

    format_on_save = { timeout_ms = 1000, lsp_format = "fallback" },
})

vim.keymap.set({ "n", "x" }, "<leader>F", function()
    conform.format({ async = true, lsp_format = "fallback" })
end, { desc = "Format buffer/selection" })
