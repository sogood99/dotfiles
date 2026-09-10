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

-- map W,B to 2w,2b
vim.keymap.set({ "n" }, "W", "2w")
vim.keymap.set({ "n" }, "B", "2b")

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
vim.keymap.set("x", "<leader>p", '"_dP')

-- send to sys clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')

-- delete to void
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')

-- tmux session
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- add to current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- add to current word

local function move_divider_left()
	local cur = vim.fn.winnr()

	if vim.fn.winnr("h") ~= cur then
		vim.cmd("wincmd h")
		vim.cmd("vertical resize -5")
		vim.cmd(cur .. "wincmd w")
	else
		vim.cmd("vertical resize -5")
	end
end
local function move_divider_right()
	if vim.fn.winnr("l") ~= vim.fn.winnr() then
		vim.cmd("vertical resize +5")
	else
		vim.cmd("vertical resize -5")
	end
end
local function move_divider_up()
	local cur = vim.fn.winnr()
	if vim.fn.winnr("k") ~= cur then
		vim.cmd("wincmd k")
		vim.cmd("resize -3")

		vim.cmd(cur .. "wincmd w")
	else
		vim.cmd("resize -3")
	end
end
local function move_divider_down()
	if vim.fn.winnr("j") ~= vim.fn.winnr() then
		vim.cmd("resize +3")
	else
		vim.cmd("resize -3")
	end
end

vim.keymap.set("n", "<C-w><C-y>", move_divider_left, { desc = "Grow left" })
vim.keymap.set("n", "<C-w><C-o>", move_divider_right, { desc = "Grow right" })
vim.keymap.set("n", "<C-w><C-u>", move_divider_down, { desc = "Grow down" })
vim.keymap.set("n", "<C-w><C-i>", move_divider_up, { desc = "Grow up" })

-- terminal mode
-- vim.keymap.set("n", "<C-a>", "<C-w>s :term<CR>")
-- vim.keymap.set("n", "<M-a>", "<C-w>v :term<CR>")

-- map Ctrl-s to Ctrl-a in visual mode (increment)
vim.keymap.set("v", "<C-s>", "<C-a>")
vim.keymap.set("v", "g<C-s>", "g<C-a>")
