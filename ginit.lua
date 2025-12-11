-----------------------------------------------------------------------------
-- => Settings for neovim-qt
-----------------------------------------------------------------------------

-- Check if running in a GUI (specifically neovim-qt usually sets g:GuiLoaded)
-- or simply check if the commands exist to avoid errors in terminal
if vim.g.GuiLoaded then
    -- Disable qt popup
    vim.cmd('GuiPopupmenu 0')

    -- Enable line spacing
    vim.cmd('GuiLinespace 1')

    -- Disable qt tab line 
    vim.cmd('GuiTabline 0')

    -- Set font
    -- Note: In Lua, spaces in font names often need escaping or proper string handling
    vim.opt.guifont = 'JetBrainsMono Nerd Font Mono'
end

-- Set format of tab name 
-- This is a standard Neovim option, works in TUI too if 'set guioptions+=e' is set, 
-- but mostly relevant for GUI.
vim.opt.guitablabel = '[%N] %t %M'

-- Set key map to paste 
-- Mapping Shift+Insert to Paste from clipboard (+)
vim.keymap.set('i', '<S-Insert>', '<C-R>+', { silent = true, noremap = true })
