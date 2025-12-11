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

    -- Buffer delete without closing window
    {
        'famiu/bufdelete.nvim',
        event = "VeryLazy",
        keys = {
            { '<leader>bd', '<cmd>Bdelete<CR>', desc = 'Delete buffer (keep window)', silent = true },
            { '<leader>bw', '<cmd>Bwipeout<CR>', desc = 'Wipeout buffer (keep window)', silent = true },
        },
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
                    separator_style = "slant",  -- Better visual separation between buffers
                    show_buffer_close_icons = true,  -- Easy buffer closing
                    show_close_icon = false,  -- Reduce clutter
                    always_show_bufferline = true,  -- Always show bufferline
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
            
            -- Theme - use deus theme that better matches Darcula
            vim.g.airline_theme = 'deus'
            
            -- Disable Tab bar (using bufferline instead)
            vim.g['airline#extensions#tabline#enabled'] = 0
            
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
