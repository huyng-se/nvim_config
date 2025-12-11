-- UI plugins: theme, bufferline, airline, icons

return {
    -- Color scheme
    {
        'doums/darcula',
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme('darcula')
        end,
    },

    -- Buffer line
    {
        'akinsho/bufferline.nvim',
        event = "VeryLazy",
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('bufferline').setup({
                options = {
                    indicator = {
                        style = 'none',
                    },
                    diagnostics = "nvim_lsp",  -- Changed from "coc" to "nvim_lsp"
                }
            })
        end,
    },

    -- Status line
    {
        'vim-airline/vim-airline',
        event = "VeryLazy",
        dependencies = { 'vim-airline/vim-airline-themes' },
        config = function()
            -- Enable font for status bar
            vim.g.airline_powerline_fonts = 1
            
            -- Theme - use dark theme that matches Darcula
            vim.g.airline_theme = 'dark'
            
            -- Enable Tab bar
            vim.g['airline#extensions#tabline#enabled'] = 1
            
            -- Enable Tab separator
            vim.g['airline#extensions#tabline#left_sep'] = ' '
            vim.g['airline#extensions#tabline#left_alt_sep'] = '|'
            
            -- Formatter
            vim.g['airline#extensions#tabline#formatter'] = 'default'
            
            -- Set Tab name as file name
            vim.g['airline#extensions#tabline#fnamemod'] = ':t'
            
            -- Remove warning whitespace
            vim.g['airline#extensions#whitespace#enabled'] = 0
            
            -- Disable error section
            vim.g.airline_section_error = ''
        end,
    },

    -- Airline themes
    {
        'vim-airline/vim-airline-themes',
        event = "VeryLazy",
    },

    -- Icons (required by various plugins)
    {
        'nvim-tree/nvim-web-devicons',
        lazy = true,
    },

    -- Legacy vim-devicons for NERDTree compatibility
    {
        'ryanoasis/vim-devicons',
        event = "VeryLazy",
    },
}
