require("treesitter-context").setup({
    max_lines = 5,
    multiline_threshold = 3,
})

vim.keymap.set("n", "[x", function()
    require("treesitter-context").go_to_context(vim.v.count1)
end, { silent = true, desc = "Jump to context" })
