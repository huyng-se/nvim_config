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
opt.relativenumber = true             -- Show relative line numbers

-- Tab settings
opt.expandtab = true                  -- Use spaces instead of tabs
opt.tabstop = 4                       -- Tab width
opt.shiftwidth = 4                    -- Indent width
opt.smartindent = true                -- Smart indentation
opt.listchars = { tab = '│ ', trail = '·', extends = '>', precedes = '<', nbsp = '␣' } -- Better listchars
opt.list = true

-- Search
opt.ignorecase = true                 -- Case-insensitive search
opt.smartcase = true                  -- Case-sensitive if uppercase present
opt.hlsearch = true                   -- Highlight search results
opt.incsearch = true                  -- Incremental search

-- UI
opt.termguicolors = true              -- True color support
opt.guifont = "JetBrainsMono Nerd Font" -- Font for GUI
opt.signcolumn = "yes"                -- Always show sign column
opt.cursorline = true                 -- Highlight current line
opt.cursorlineopt = "number"          -- Only highlight line number
opt.scrolloff = 8                     -- Keep 8 lines above/below cursor
opt.sidescrolloff = 8                 -- Keep 8 columns left/right
opt.wrap = false                      -- Don't wrap lines
opt.showmode = false                  -- Don't show mode (lualine does this)
opt.showcmd = false                   -- Don't show command in status line
opt.cmdheight = 0                     -- Height of command line (set to 0 after installing Noice)
opt.laststatus = 3                    -- Global status line
opt.pumheight = 10                    -- Max height of popup menu

-- Folding (using treesitter)
opt.foldmethod = 'expr'                           -- Use expression for folding
opt.foldexpr = 'nvim_treesitter#foldexpr()'      -- Treesitter folding
opt.foldlevelstart = 99                           -- Start with all folds open
opt.foldnestmax = 3                               -- Maximum nested folds
opt.foldenable = true                             -- Enable folding

-- Performance
opt.synmaxcol = 300                                -- Limit syntax highlighting
opt.lazyredraw = false                             -- Don't lazy redraw (better for modern systems)
opt.updatetime = 100                               -- Faster update time
opt.timeoutlen = 300                               -- Time to wait for mapped sequence
opt.ttimeoutlen = 0                                -- Time for key code delay

-- Backup and undo
opt.backup = false                    -- No backup file
opt.writebackup = false               -- No backup before overwriting
opt.swapfile = false                  -- No swap file
opt.undofile = true                   -- Persistent undo
opt.undolevels = 10000                -- Maximum undo levels

-- Completion
opt.completeopt = { 'menuone', 'noselect', 'noinsert' } -- Better completion
opt.shortmess:append('c')             -- Don't show completion messages

-- Clipboard
if vim.fn.has('win32') == 1 then
    opt.clipboard = 'unnamed'
else
    opt.clipboard = 'unnamedplus'
end

-- Splits
opt.splitbelow = true                 -- Horizontal splits below
opt.splitright = true                 -- Vertical splits right

-- Wildmenu
opt.wildmenu = true                   -- Enhanced command line completion
opt.wildmode = 'longest:full,full'    -- Wildmenu behavior

-- Enable syntax highlighting
vim.cmd('syntax on')

-- Disable some built-in plugins for performance
vim.g.loaded_gzip = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_logipat = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1
