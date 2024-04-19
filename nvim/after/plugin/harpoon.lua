local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

vim.keymap.set("n", "<M-w>", mark.add_file)
vim.keymap.set("n", "<M-e>", ui.toggle_quick_menu)

for i = 1, 10 do
    vim.keymap.set("n", "<M-" .. i .. ">", function() ui.nav_file(i) end)
end
