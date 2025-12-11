local map = vim.keymap.set
local g = vim.g

-----------------------------------------------------------------------------
-- => Mappings
-----------------------------------------------------------------------------
-- F5 to toggle 
map('n', '<F5>', ':NERDTreeToggle<CR>', { silent = true })

-----------------------------------------------------------------------------
-- => UI & Icons
-----------------------------------------------------------------------------
-- Change arrow to expand/collapse tree
g.NERDTreeDirArrowExpandable = '▸'
g.NERDTreeDirArrowCollapsible = '▾'

-- Git status icon
g.NERDTreeGitStatusIndicatorMapCustom = {
    Modified  = '✹',
    Staged    = '✚',
    Untracked = '✭',
    Renamed   = '➜',
    Unmerged  = '═',
    Deleted   = '✖',
    Dirty     = '✗',
    Ignored   = '☒',
    Clean     = '✔︎',
    Unknown   = '?'
}

-- Highlight current file
g.nerdtree_sync_cursorline = 1

-- Ignore some type of files
g.NERDTreeIgnore = { '__pycache__', 'site-packages' }

-----------------------------------------------------------------------------
-- => Autocommands (Logic)
-----------------------------------------------------------------------------
local nerdtree_group = vim.api.nvim_create_augroup("NERDTreeConfig", { clear = true })

-- Exit Vim if NERDTree is the only window left.
-- Note: Keeping this as a vim command string is safest for interacting with b:NERDTree objects
vim.api.nvim_create_autocmd("BufEnter", {
    group = nerdtree_group,
    pattern = "*",
    command = "if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif"
})

-- If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
vim.api.nvim_create_autocmd("BufEnter", {
    group = nerdtree_group,
    pattern = "*",
    command = [[if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 | let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif]]
})

-- Open file, then sync directory that contains that file (Windows specific)
if vim.fn.has('win32') == 1 then
    vim.api.nvim_create_autocmd("BufEnter", {
        group = nerdtree_group,
        pattern = "*",
        command = "lcd %:p:h"
    })
end

-- (Optional) Uncomment if you want to mirror NERDTree on new tab
-- vim.api.nvim_create_autocmd("BufWinEnter", {
--     group = nerdtree_group,
--     pattern = "*",
--     command = "silent NERDTreeMirror"
-- })
