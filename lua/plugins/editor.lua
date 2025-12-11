-- Editor plugins: file explorer, fuzzy finder

return {
    -- File explorer - NERDTree (keeping original choice)
    {
        'preservim/nerdtree',
        cmd = { "NERDTreeToggle", "NERDTreeFind" },
        keys = {
            { '<F5>', ':NERDTreeToggle<CR>', desc = 'Toggle NERDTree' },
        },
        dependencies = {
            'Xuyuanp/nerdtree-git-plugin',
            'ryanoasis/vim-devicons',
            'unkiwii/vim-nerdtree-sync',
            {
                'jcharum/vim-nerdtree-syntax-highlight',
                branch = 'escape-keys'
            },
        },
        config = function()
            -- Change arrow to expand/collapse tree
            vim.g.NERDTreeDirArrowExpandable = '▸'
            vim.g.NERDTreeDirArrowCollapsible = '▾'
            
            -- Git status icon
            vim.g.NERDTreeGitStatusIndicatorMapCustom = {
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
            vim.g.nerdtree_sync_cursorline = 1
            
            -- Ignore some type of files
            vim.g.NERDTreeIgnore = { '__pycache__', 'site-packages' }
            
            -- Autocommands
            local nerdtree_group = vim.api.nvim_create_augroup("NERDTreeConfig", { clear = true })
            
            -- Exit Vim if NERDTree is the only window left
            vim.api.nvim_create_autocmd("BufEnter", {
                group = nerdtree_group,
                pattern = "*",
                command = "if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif"
            })
            
            -- If another buffer tries to replace NERDTree, put it in the other window
            vim.api.nvim_create_autocmd("BufEnter", {
                group = nerdtree_group,
                pattern = "*",
                command = [[if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 | let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif]]
            })
            
            -- Windows specific: open file then sync directory
            if vim.fn.has('win32') == 1 then
                vim.api.nvim_create_autocmd("BufEnter", {
                    group = nerdtree_group,
                    pattern = "*",
                    command = "lcd %:p:h"
                })
            end
        end,
    },

    -- Fuzzy finder - FZF (keeping original choice)
    {
        'junegunn/fzf',
        build = function()
            vim.fn['fzf#install']()
        end,
    },

    {
        'junegunn/fzf.vim',
        cmd = { 'Files', 'Rg', 'Buffers', 'BLines', 'Lines' },
        keys = {
            { '<F6>', ':Files<CR>', desc = 'FZF Files' },
            { '<F7>', ':Rg<CR>', desc = 'FZF Ripgrep' },
        },
        dependencies = { 'junegunn/fzf' },
        config = function()
            -- General FZF Settings
            vim.g.fzf_action = {
                ['ctrl-t'] = 'tab split',
                ['ctrl-x'] = 'split',
                ['ctrl-v'] = 'vsplit'
            }
            
            vim.g.fzf_layout = {
                window = {
                    width = 0.8,
                    height = 0.5,
                    highlight = 'Comment'
                }
            }
            
            vim.g.fzf_preview_window = {'right:50%', 'ctrl-/'}
            vim.g.fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
            
            -- Custom Highlight Definitions
            vim.api.nvim_set_hl(0, 'fzf_fg',      { ctermfg = 14 })
            vim.api.nvim_set_hl(0, 'fzf_fgp',     { ctermfg = 3 })
            vim.api.nvim_set_hl(0, 'fzf_hl',      { ctermfg = 5 })
            vim.api.nvim_set_hl(0, 'fzf_hlp',     { ctermfg = 5 })
            vim.api.nvim_set_hl(0, 'fzf_info',    { ctermfg = 6 })
            vim.api.nvim_set_hl(0, 'fzf_prompt',  { ctermfg = 6 })
            vim.api.nvim_set_hl(0, 'fzf_spinner', { ctermfg = 6 })
            vim.api.nvim_set_hl(0, 'fzf_pointer', { ctermfg = 3 })
            
            vim.g.fzf_colors = {
                fg      = {'fg', 'fzf_fg'},
                hl      = {'fg', 'fzf_hl'},
                ['fg+'] = {'fg', 'fzf_fgp'},
                ['hl+'] = {'fg', 'fzf_hlp'},
                info    = {'fg', 'fzf_info'},
                prompt  = {'fg', 'fzf_prompt'},
                pointer = {'fg', 'fzf_pointer'},
                spinner = {'fg', 'fzf_spinner'}
            }
            
            -- Custom Commands
            vim.api.nvim_create_user_command('Files', function(opts)
                local fzf_opts = vim.fn['fzf#vim#with_preview']({
                    options = {'--layout=reverse', '--info=inline'}
                })
                vim.fn['fzf#vim#files'](opts.args, fzf_opts, opts.bang)
            end, { bang = true, nargs = '?', complete = 'dir' })
            
            vim.api.nvim_create_user_command('Rg', function(opts)
                local cmd = 'rg --column --line-number --color=always --smart-case -- ' .. vim.fn.shellescape(opts.args)
                local fzf_opts = {
                    options = {'--exact', '--layout=reverse'}
                }
                vim.fn['fzf#vim#grep'](cmd, 1, fzf_opts, opts.bang)
            end, { bang = true, nargs = '*' })
            
            -- Environment Variables
            vim.env.FZF_DEFAULT_COMMAND = 'find . \\( -name __pycache__ -o -name .git -name .vagrant \\) -prune -o -print'
        end,
    },
}
