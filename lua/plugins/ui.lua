-- UI plugins: theme, bufferline, airline, icons

return {
    -- Color scheme
    {
        'doums/darcula',
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme('darcula')
            
            -- Overwrite some color highlights (from original config)
            local color_extend_group = vim.api.nvim_create_augroup("ColorExtend", { clear = true })
            vim.api.nvim_create_autocmd("ColorScheme", {
                group = color_extend_group,
                pattern = "*",
                callback = function()
                    -- Note: onedark#extend_highlight may not work with darcula theme
                    -- This was in original config but might need adjustment
                    pcall(vim.fn['onedark#extend_highlight'], "Comment", { fg = { gui = "#728083" } })
                    pcall(vim.fn['onedark#extend_highlight'], "LineNr", { fg = { gui = "#728083" } })
                end
            })
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
            
            -- Theme
            vim.g.airline_theme = 'onedark'
            
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
