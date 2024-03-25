-- https://neovim.io/doc/user/api.html#nvim_set_keymap()
-- https://neovim.io/doc/user/intro.html#keycodes

local map = vim.api.nvim_set_keymap

--nvim.tree specific stuff
-- normal mode: use 't' to focus nvim.tree
map('n', ':f', [[:NvimTreeFocus]], {})

-- normal mode: use ':n' to create new file
map('n', ':n', 'a', {})

-- normal mode: use ':r' to rename file
map('n', ':r', 'r', {})

-- normal mode: use ':d' to delete file
map('n', ':d', 'd', {})
