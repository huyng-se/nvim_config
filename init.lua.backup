print('Neovim started...')

-----------------------------------------------------------------------------
-- => General settings
-----------------------------------------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

local opt = vim.opt

opt.mouse = 'a'                       -- Enable mouse
opt.expandtab = true                  -- Tab setting 
opt.tabstop = 4                       -- Tab setting 
opt.shiftwidth = 4                    -- Tab setting
opt.listchars = { tab = '¦ ' }        -- Tab character 
opt.list = true
opt.foldmethod = 'syntax'
opt.foldnestmax = 1
opt.foldlevelstart = 3
opt.number = true                     -- Show line number
opt.ignorecase = true                 -- Enable case-sensitive 

-- Disable backup
opt.backup = false
opt.writebackup = false
opt.swapfile = false

-- Optimize 
opt.synmaxcol = 3000                  -- Prevent breaking syntax highlight when string too long
opt.lazyredraw = true

-- Change foldmethod for specific filetype
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = "*.json",
    command = "set foldmethod=indent"
})

vim.cmd('syntax on')

-- Enable copying from vim to clipboard
if vim.fn.has('win32') == 1 then
    opt.clipboard = 'unnamed'
else
    opt.clipboard = 'unnamedplus'
end

-- Auto reload content changed outside
local auto_reload_group = vim.api.nvim_create_augroup("AutoReload", { clear = true })

vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
    group = auto_reload_group,
    pattern = "*",
    command = "checktime"
})

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
    group = auto_reload_group,
    pattern = "*",
    command = "checktime"
})

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
    group = auto_reload_group,
    pattern = "*",
    callback = function()
        local mode = vim.fn.mode()
        -- Regex equivalent to: mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == ''
        if not mode:match("[cr!t]") and vim.fn.getcmdwintype() == '' then
            vim.cmd('checktime')
        end
    end
})

vim.api.nvim_create_autocmd("FileChangedShellPost", {
    group = auto_reload_group,
    pattern = "*",
    callback = function()
        vim.api.nvim_command("echohl WarningMsg")
        vim.api.nvim_command('echo "File changed on disk. Buffer reloaded."')
        vim.api.nvim_command("echohl None")
    end
})

-----------------------------------------------------------------------------
-- => Key mappings
-----------------------------------------------------------------------------
local map = vim.keymap.set

map('n', '<S-l>', ':bnext<CR>', { silent = true }) -- Next buffer
map('n', '<S-h>', ':bprev<CR>', { silent = true }) -- Previous buffer

-- Resize pane
map('n', '<M-Right>', ':vertical resize +1<CR>', { silent = true })
map('n', '<M-Left>', ':vertical resize -1<CR>', { silent = true })
map('n', '<M-Down>', ':resize +1<CR>', { silent = true })
map('n', '<M-Up>', ':resize -1<CR>', { silent = true })

-- Search a highlighted text (Visual mode mapping)
-- Note: Requires complex escaping logic, simpler to keep as vim command or use a lua function
vim.cmd("vnoremap // y/\\V<C-R>=escape(@\",'/\\')<CR><CR>")

-- Clear highlight
map('n', '/\\', ':noh<CR>', { silent = true })

-----------------------------------------------------------------------------
-- => Plugin list
-- (Vim-plug is Vimscript based, so we wrap it in vim.cmd)
-----------------------------------------------------------------------------
vim.cmd [[
call plug#begin(stdpath('config').'/plugged')
" Theme
  Plug 'doums/darcula'
  Plug 'akinsho/bufferline.nvim', { 'tag': '*' }

" File browser
  Plug 'preservim/nerdTree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'ryanoasis/vim-devicons'
  Plug 'unkiwii/vim-nerdtree-sync'
  Plug 'jcharum/vim-nerdtree-syntax-highlight', {'branch': 'escape-keys'}

" File search
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

" Status bar
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

" Terminal
  Plug 'voldikss/vim-floaterm'

" Code intellisense
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'jiangmiao/auto-pairs'
  Plug 'mattn/emmet-vim' 
  Plug 'preservim/nerdcommenter'
  Plug 'alvan/vim-closetag', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }
  Plug 'mrcjkb/rustaceanvim', { 'tag': 'v5.*' }

" Code syntax highlight
  Plug 'sheerun/vim-polyglot'
  Plug 'rust-lang/rust.vim'
  Plug 'nvim-lua/plenary.nvim' 
  Plug 'saecki/crates.nvim', { 'tag': 'stable' }

" Debugging
  Plug 'puremourning/vimspector'

" Source code version control 
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb' 
  Plug 'airblade/vim-gitgutter'
  Plug 'samoshkin/vim-mergetool'

" Fold 
  Plug 'tmhedberg/SimpylFold'
call plug#end()
]]

-----------------------------------------------------------------------------
-- => Plugin Setting
-----------------------------------------------------------------------------
-- Set theme 
vim.cmd.colorscheme('darcula')
opt.termguicolors = true

-- Setup bufferline (Lua native setup)
-- We use pcall to avoid errors if plugin isn't installed yet
local status_ok, bufferline = pcall(require, "bufferline")
if status_ok then
    bufferline.setup{
      options = {
        indicator = {
          style = 'none',
        },
        diagnostics = "coc",
      }
    }
end

-- Overwrite some color highlight 
local color_extend_group = vim.api.nvim_create_augroup("ColorExtend", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
    group = color_extend_group,
    pattern = "*",
    callback = function()
        -- onedark#extend_highlight is a Vimscript function, must use vim.fn or vim.cmd
        vim.fn['onedark#extend_highlight']("Comment", { fg = { gui = "#728083" } })
        vim.fn['onedark#extend_highlight']("LineNr", { fg = { gui = "#728083" } })
    end
})

-- Disable automatic comment in newline
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o"
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function()
    vim.b.coc_enabled = 0
  end,
})

-- Search and Replace hack (Visual mode)
map('v', '<C-r>', '"hy:%s/<C-r>h//gc<left><left><left>')

-- Close buffer without exiting vim 
map('n', '<leader>bd', ':bp | sp | bn | bd<CR>', { silent = true })

-- Other setting (Source all .vim files in settings directory)
local config_path = vim.fn.stdpath('config')
local setting_files = vim.fn.glob(config_path .. '/settings/*.lua', false, true)

for _, file in ipairs(setting_files) do
    vim.cmd('source ' .. file)
end

