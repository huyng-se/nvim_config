-- Git integration plugins

return {
    -- Gitsigns (modern replacement for vim-gitgutter)
    {
        'lewis6991/gitsigns.nvim',
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('gitsigns').setup({
                signs = {
                    add          = { text = '✚' },
                    change       = { text = '✹' },
                    delete       = { text = '✖' },
                    topdelete    = { text = '‾' },
                    changedelete = { text = '~' },
                    untracked    = { text = '┆' },
                },
                signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
                numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
                linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
                word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
                watch_gitdir = {
                    interval = 1000,
                    follow_files = true
                },
                attach_to_untracked = true,
                current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
                current_line_blame_opts = {
                    virt_text = true,
                    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                    delay = 1000,
                    ignore_whitespace = false,
                },
                sign_priority = 6,
                update_debounce = 100,
                status_formatter = nil, -- Use default
                max_file_length = 40000,
                preview_config = {
                    -- Options passed to nvim_open_win
                    border = 'rounded',
                    style = 'minimal',
                    relative = 'cursor',
                    row = 0,
                    col = 1
                },
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns
                    
                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end
                    
                    -- Navigation
                    map('n', ']c', function()
                        if vim.wo.diff then return ']c' end
                        vim.schedule(function() gs.next_hunk() end)
                        return '<Ignore>'
                    end, {expr=true, desc = 'Next git hunk'})
                    
                    map('n', '[c', function()
                        if vim.wo.diff then return '[c' end
                        vim.schedule(function() gs.prev_hunk() end)
                        return '<Ignore>'
                    end, {expr=true, desc = 'Previous git hunk'})
                    
                    -- Actions
                    map('n', '<leader>gp', gs.preview_hunk, { desc = 'Preview git hunk' })
                    map('n', '<leader>gb', function() gs.blame_line{full=true} end, { desc = 'Git blame line' })
                end
            })
        end,
    },

    -- Vim Fugitive
    {
        'tpope/vim-fugitive',
        cmd = { 'Git', 'Gdiffsplit', 'Gread', 'Gwrite', 'Ggrep', 'GMove', 'GDelete', 'GBrowse', 'GRemove', 'GRename', 'Glgrep', 'Gedit' },
        keys = {
            { '<leader>gs', ':Git<CR>', desc = 'Git status' },
        },
    },

    -- GitHub integration for vim-fugitive
    {
        'tpope/vim-rhubarb',
        dependencies = { 'tpope/vim-fugitive' },
        cmd = { 'GBrowse' },
    },

    -- Git mergetool
    {
        'samoshkin/vim-mergetool',
        cmd = { 'MergetoolStart', 'MergetoolToggle' },
        keys = {
            { '<leader>mt', '<plug>(MergetoolToggle)', desc = 'Toggle Git Mergetool' },
        },
        config = function()
            -- Layout: 'mr' means Merge Result on the right
            vim.g.mergetool_layout = 'mr'
            
            -- Prefer 'local' revision when resolving conflicts
            vim.g.mergetool_prefer_revision = 'local'
        end,
    },

    -- Lazygit integration - Terminal UI for Git
    -- Note: Requires lazygit binary to be installed (https://github.com/jesseduffield/lazygit)
    {
        'kdheepak/lazygit.nvim',
        cmd = {
            'LazyGit',
            'LazyGitConfig',
            'LazyGitCurrentFile',
            'LazyGitFilter',
            'LazyGitFilterCurrentFile',
        },
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        keys = {
            { '<leader>gg', '<cmd>LazyGit<CR>', desc = 'LazyGit (Git UI)' },
            { '<leader>lg', '<cmd>LazyGit<CR>', desc = 'LazyGit (alternative)' },
        },
        config = function()
            -- LazyGit opens in a floating window by default
            -- Set floating window size
            vim.g.lazygit_floating_window_winblend = 0 -- Transparency of floating window
            vim.g.lazygit_floating_window_scaling_factor = 0.9 -- Scaling factor for floating window (0-1)
            vim.g.lazygit_floating_window_border_chars = {'╭','─', '╮', '│', '╯','─', '╰', '│'} -- Border style
            vim.g.lazygit_floating_window_use_plenary = 1 -- Use plenary.nvim for floating window
            
            -- Use neovim remote to open files from lazygit in the same instance
            vim.g.lazygit_use_neovim_remote = 1
        end,
    },
}
