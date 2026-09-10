require("diffview").setup({})

local map = vim.keymap.set
map("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "Diff: uncommitted changes" })
map("n", "<leader>gc", "<cmd>DiffviewOpen HEAD^!<cr>", { desc = "Diff: last commit" })
map("n", "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", { desc = "Diff: current file historry" })
map("n", "<leader>gH", "<cmd>DiffviewFileHistory<cr>", { desc = "Diff: branch history" })
map("n", "<leader>gq", "<cmd>DiffviewClose<cr>", { desc = "Diff: close" })
