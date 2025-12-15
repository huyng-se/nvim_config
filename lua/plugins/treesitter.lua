return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        lazy = false,
        config = function()
            -- Install parsers
            require('nvim-treesitter').install({ 
                'lua', 'vim', 'vimdoc', 'c', 'cpp', 'python', 'rust',
                'javascript', 'typescript', 'tsx', 'css', 'html', 'json'
            })
            
            -- Enable treesitter features via autocommand
            vim.api.nvim_create_autocmd('FileType', {
                pattern = { 
                    'lua', 'vim', 'c', 'cpp', 'python', 'rust',
                    'javascript', 'typescript', 'typescriptreact', 'javascriptreact',
                    'css', 'html', 'json'
                },
                callback = function()
                    -- Syntax highlighting (provided by Neovim)
                    vim.treesitter.start()
                    
                    -- Folds (provided by Neovim)
                    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
                    vim.wo.foldmethod = 'expr'
                    
                    -- Indentation (provided by nvim-treesitter)
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })
        end,
    }
}