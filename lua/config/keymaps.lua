-- Key mappings configuration
-- Migrated from init.lua with improvements

local map = vim.keymap.set

-- Disable space in normal and visual mode (since it's the leader key)
map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Buffer navigation
map('n', '<S-l>', ':bnext<CR>', { silent = true, desc = 'Next buffer' })
map('n', '<S-h>', ':bprev<CR>', { silent = true, desc = 'Previous buffer' })
map('n', '<leader>bd', ':bp | sp | bn | bd<CR>', { silent = true, desc = 'Close buffer without closing window' })

-- Resize panes (increased step from 1 to 2 for faster resizing)
map('n', '<M-Right>', ':vertical resize +2<CR>', { silent = true, desc = 'Increase vertical split' })
map('n', '<M-Left>', ':vertical resize -2<CR>', { silent = true, desc = 'Decrease vertical split' })
map('n', '<M-Down>', ':resize +2<CR>', { silent = true, desc = 'Increase horizontal split' })
map('n', '<M-Up>', ':resize -2<CR>', { silent = true, desc = 'Decrease horizontal split' })

-- Clear search highlight (using Esc instead of /\)
map('n', '<Esc>', ':noh<CR>', { silent = true, desc = 'Clear search highlight' })

-- Better indenting (stay in visual mode after indent)
map('v', '<', '<gv', { desc = 'Indent left' })
map('v', '>', '>gv', { desc = 'Indent right' })

-- Search highlighted text in visual mode
vim.cmd("vnoremap // y/\\V<C-R>=escape(@\",'/\\')<CR><CR>")

-- Search and replace in visual mode
map('v', '<C-r>', '"hy:%s/<C-r>h//gc<left><left><left>', { desc = 'Search and replace selected text' })
