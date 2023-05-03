-- https://neovim.io/doc/user/api.html#nvim_set_keymap()
-- https://neovim.io/doc/user/intro.html#keycodes

local map = vim.api.nvim_set_keymap

-- normal mode: use 't' to focus nvim.tree
map('n', ':t', [[:NvimTreeFocus]], {})

-- normal mode: use ':n' to create new file
map('n', ':n', 'a', {})

-- normal mode: use ':r' to rename file
map('n', ':r', 'r', {})

-- normal mode: use ':d' to delete file
map('n', ':d', 'd', {})

-- normal and insert mode: use shift-arrow keys to select entire line
map('n', '<S-Right>', '<Esc>vV', { noremap = true })
map('i', '<S-Right>', '<Esc>vV', { noremap = true })
map('n', '<S-Left>', '<Esc>vV', { noremap = true })
map('i', '<S-Left>', '<Esc>vV', { noremap = true })

-- visual mode: use backspace to delete
map('v', '<BS>', '"_d', { noremap = true })

-- visual mode: use standard keys to copy
map('v', 'c', 'y', { noremap = true })

-- visual mode: use standarad keys to indent
map('v', '<Tab>', '>', {})
map('v', '<S-Tab>', '<', {})

-- normal mode: standard key to paste
map('n', 'v', 'p', { noremap = true })

-- normal mode: get into visual mode
map('n', ':vis', 'v', { noremap = true })

-- normal mode: use standard keys to undo/redo
map('n', 'z', 'u',  { noremap = true })
map('n', '<S-z>', '<C-r>', { noremap = true })

-- normal mode: open/collapse sections
map('n', '<Tab>', 'zo', { noremap = true })
map('n', '<S-Tab>', 'zc', { noremap = true })
map('n', '<S-Tab><S-Tab>', 'zM', { noremap = true })
