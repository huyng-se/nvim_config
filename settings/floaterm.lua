-----------------------------------------------------------------------------
-- => Floaterm Configuration
-----------------------------------------------------------------------------

-- Global variables configuration
vim.g.floaterm_position = 'topright'
vim.g.floaterm_width = 0.6
vim.g.floaterm_height = 0.8
vim.g.floaterm_title = 'Terminal $1/$2'
vim.g.floaterm_wintype = 'float'
vim.g.floaterm_rootmarkers = {'.pro'}

-- Windows specific shell configuration
if vim.fn.has('win32') == 1 then
    vim.g.floaterm_shell = 'powershell -nologo'
end

-- Set colors
-- Using vim.api.nvim_set_hl is the modern Lua way for highlights
vim.api.nvim_set_hl(0, 'Floaterm', { bg = 'Grey15' })
vim.api.nvim_set_hl(0, 'FloatermBorder', { fg = 'Orange', bg = 'DarkGreen' })
-- vim.api.nvim_set_hl(0, 'FloatermNC', { bg = 'darkred' })

-----------------------------------------------------------------------------
-- => Hotkey to manage terminals
-----------------------------------------------------------------------------
local keymap = vim.keymap.set
local opts = { silent = true }

-- Helper function to map keys for both Normal and Terminal modes
-- cmd_n: Command for Normal mode
-- cmd_t: Command for Terminal mode (automatically prepends <C-\><C-n> if needed)
local function map_pair(key, cmd_n, cmd_t)
    keymap('n', key, cmd_n, opts)
    -- If cmd_t is provided, use it; otherwise use cmd_n prepended with escape sequence
    local t_command = cmd_t or ([[<C-\><C-n>]] .. cmd_n)
    keymap('t', key, t_command, opts)
end

-- Open a new terminal
map_pair('<leader>to', ':FloatermNew<CR>')

-- Kill current terminal (Kill then go to Prev)
map_pair('<leader>tk', ':FloatermKill<CR>:FloatermPrev<CR>')

-- Navigation next and previous terminal
map_pair('<leader>tn', ':FloatermNext<CR>')
map_pair('<leader>tp', ':FloatermPrev<CR>')

-- Toggle terminal
map_pair('<leader>tt', ':FloatermToggle<CR>')

-- Focus terminal (Move focus to the left window)
-- Note: In terminal mode, we escape first then move window
map_pair('<leader>tf', [[<C-\><C-n><C-W><Left>]], [[<C-\><C-n><C-W><Left>]])

-----------------------------------------------------------------------------
-- => Hotkey to run other console apps
-----------------------------------------------------------------------------
-- Git Log
keymap('n', '<leader>gl', ":FloatermNew! --position=bottomright --height=0.95 --width=0.7 --title='GitLog' git lg<CR>", opts)

-- Autocmd example (The original config had this empty, but here is how to add it in Lua if needed)
-- vim.api.nvim_create_autocmd("User", {
--     pattern = "FloatermOpen",
--     callback = function()
--         -- Custom logic when floaterm opens
--     end
-- })
