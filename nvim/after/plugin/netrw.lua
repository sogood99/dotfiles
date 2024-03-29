local netrw = require 'netrw'

vim.g.netrw_liststyle = 1
vim.g.netrw_sizestyle = "h"
vim.g.netrw_maxfilenamelen = 60

netrw.setup {
    -- Put your configuration here, or leave the object empty to take the default
    -- configuration.
    -- icons = {
    --     symlink = '', -- Symlink icon (directory and file)
    -- directory = '', -- Directory icon
    --     file = '', -- File icon
    -- },
    use_devicons = true, -- Uses nvim-web-devicons if true, otherwise use the file icon specified above
    mappings = {},       -- Custom key mappings
}
