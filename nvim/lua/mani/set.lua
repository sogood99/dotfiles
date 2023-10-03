-- line number on
vim.opt.nu = true
vim.opt.relativenumber = true

-- set tab size, tab to space
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- show keystroke
vim.opt.showcmd = true

vim.opt.smartindent = true

-- save to undodir
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- increment search with smartcase
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

-- always more than 8
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.g.mapleader = " "

-- autowrite
vim.opt.autowrite = true

-- dont use mouse
vim.opt.mouse = ""

-- no newline on comment
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

-- split direction
vim.opt.splitbelow = true
vim.opt.splitright = true
