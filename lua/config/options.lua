-- Options configuration
-- Migrated from init.lua with improvements

local opt = vim.opt

-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Mouse
opt.mouse = 'a'                       -- Enable mouse

-- Line numbers
opt.number = true                     -- Show line number
opt.relativenumber = true             -- Show relative line numbers (NEW)

-- Tab settings
opt.expandtab = true                  -- Use spaces instead of tabs
opt.tabstop = 4                       -- Tab width
opt.shiftwidth = 4                    -- Indent width
opt.listchars = { tab = '¦ ' }        -- Tab character
opt.list = true

-- Search
opt.ignorecase = true                 -- Case-insensitive search
opt.smartcase = true                  -- Case-sensitive if uppercase present

-- UI
opt.termguicolors = true              -- True color support
opt.signcolumn = "yes"                -- Always show sign column (NEW)
opt.cursorline = true                 -- Highlight current line (NEW)
opt.scrolloff = 8                     -- Keep 8 lines above/below cursor (NEW)
opt.wrap = false                      -- Don't wrap lines

-- Folding (using treesitter)
opt.foldmethod = 'expr'                           -- Use expression for folding (NEW)
opt.foldexpr = 'nvim_treesitter#foldexpr()'      -- Treesitter folding (NEW)
opt.foldlevelstart = 99                           -- Start with all folds open (NEW)
opt.foldnestmax = 1

-- Performance
opt.synmaxcol = 500                   -- Limit syntax highlighting (changed from 3000)
opt.lazyredraw = true                 -- Don't redraw during macros
opt.updatetime = 200                  -- Update diagnostics faster (default is 4000ms)

-- Backup and undo
opt.backup = false                    -- No backup file
opt.writebackup = false               -- No backup before overwriting
opt.swapfile = false                  -- No swap file
opt.undofile = true                   -- Persistent undo (NEW)

-- Clipboard
if vim.fn.has('win32') == 1 then
    opt.clipboard = 'unnamed'
else
    opt.clipboard = 'unnamedplus'
end

-- Enable syntax highlighting
vim.cmd('syntax on')
