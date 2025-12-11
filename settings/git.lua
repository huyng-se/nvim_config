-----------------------------------------------------------------------------
-- => Git Mergetool Configuration
-----------------------------------------------------------------------------
-- Layout: 'mr' means Merge Result on the right
vim.g.mergetool_layout = 'mr'

-- Prefer 'local' revision when resolving conflicts
vim.g.mergetool_prefer_revision = 'local'

-- Toggle keymap
vim.keymap.set('n', '<leader>mt', '<plug>(MergetoolToggle)', { silent = true, desc = 'Toggle Git Mergetool' })

-----------------------------------------------------------------------------
-- => Git Gutter Configuration
-----------------------------------------------------------------------------
-- Custom signs
vim.g.gitgutter_sign_added = '✚'
vim.g.gitgutter_sign_modified = '✹'
vim.g.gitgutter_sign_removed = '✖'

-- Floating window for previewing hunks
vim.g.gitgutter_preview_win_floating = 1

-- Optimization:
-- Reduce update time for faster gitgutter updates (optional but recommended)
-- Only set this if you haven't set it elsewhere (e.g., in coc.nvim config)
if vim.opt.updatetime:get() > 500 then
    vim.opt.updatetime = 300
end

-- Mappings for GitGutter (Added for convenience, though not in your original snippet)
-- You might find these useful:
-- vim.keymap.set('n', ']c', '<Plug>(GitGutterNextHunk)', { silent = true })
-- vim.keymap.set('n', '[c', '<Plug>(GitGutterPrevHunk)', { silent = true })
-- vim.keymap.set('n', '<leader>gp', '<Plug>(GitGutterPreviewHunk)', { silent = true })
