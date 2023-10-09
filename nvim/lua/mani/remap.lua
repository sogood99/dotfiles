vim.g.mapleader = " "
vim.keymap.set("n", "<C-g>", vim.cmd.Ex)

-- remap navigation in normal mode
vim.keymap.set("n", "<C-H>", "<C-W><C-H>")
vim.keymap.set("n", "<C-J>", "<C-W><C-J>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")

-- move panel
vim.keymap.set("n", "<C-W><C-H>", "<C-W><S-H>")
vim.keymap.set("n", "<C-W><C-J>", "<C-W><S-J>")
vim.keymap.set("n", "<C-W><C-K>", "<C-W><S-K>")
vim.keymap.set("n", "<C-W><C-L>", "<C-W><S-L>")

-- terminal mode use ESC to return to normal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- move panel in terminal mode
vim.keymap.set({ "t", "i" }, "<C-H>", "<C-\\><C-n><C-W><C-H>")
vim.keymap.set({ "t", "i" }, "<C-J>", "<C-\\><C-n><C-W><C-J>")
vim.keymap.set({ "t", "i" }, "<C-K>", "<C-\\><C-n><C-W><C-K>")
vim.keymap.set({ "t", "i" }, "<C-L>", "<C-\\><C-n><C-W><C-L>")

-- stop highlight
vim.keymap.set("n", "<CR>", ":noh<CR>", { silent = true })

-- move in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- ctrl d/u stays in middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- n/N stay in middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- send overwritten P to void
vim.keymap.set("x", "<leader>p", "\"_dP")

-- send to sys clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", "\"+y")

-- delete to void
vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d")

-- tmux session
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- add to current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- add to current word

local function t(str)
    -- Adjust boolean arguments as needed
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function MoveHorizontal(dir)
    if vim.fn.winnr('l') ~= vim.fn.winnr() then
        if dir == 0 then
            vim.cmd.normal(t '<C-W><')
        else
            vim.cmd.normal(t '<C-W>>')
        end
    else
        if dir == 0 then
            vim.cmd.normal(t '<C-W>>')
        else
            vim.cmd.normal(t '<C-W><')
        end
    end
end

function MoveVertical(dir)
    if (vim.fn.winnr('j') ~= vim.fn.winnr()) and (vim.fn.winnr('k') == vim.fn.winnr()) then
        if dir == 0 then
            vim.cmd.normal(t '<C-W>+')
        else
            vim.cmd.normal(t '<C-W>-')
        end
    else
        if dir == 0 then
            vim.cmd.normal(t '<C-W>-')
        else
            vim.cmd.normal(t '<C-W>+')
        end
    end
end

-- map F5-8 to move
vim.keymap.set({ "n", "t" }, "<F5>", function() MoveHorizontal(0) end)
vim.keymap.set({ "n", "t" }, "<F8>", function() MoveHorizontal(1) end)
vim.keymap.set({ "n", "t" }, "<F6>", function() MoveVertical(0) end)
vim.keymap.set({ "n", "t" }, "<F7>", function() MoveVertical(1) end)

-- terminal mode
-- vim.keymap.set("n", "<C-a>", "<C-w>s :term<CR>")
-- vim.keymap.set("n", "<M-a>", "<C-w>v :term<CR>")
