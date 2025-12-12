-- UI plugins: theme, bufferline, statusline, icons

return {
    -- Color scheme - Catppuccin
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        lazy = false,
        priority = 1000,
        config = function()
            require('catppuccin').setup({
                flavour = 'mocha',
                transparent_background = false,
                term_colors = true,
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    nvimtree = true,
                    telescope = true,
                    treesitter = false, -- since we removed treesitter
                    notify = false,
                    mini = false,
                },
            })
            vim.cmd.colorscheme('catppuccin')
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
                    mode = 'buffers',
                    numbers = 'none',
                    close_command = 'Bdelete! %d',
                    right_mouse_command = 'Bdelete! %d',
                    left_mouse_command = 'buffer %d',
                    middle_mouse_command = 'Bdelete! %d',
                    indicator = {
                        icon = '▎',
                        style = 'icon',
                    },
                    buffer_close_icon = '',
                    modified_icon = '●',
                    close_icon = '',
                    left_trunc_marker = '',
                    right_trunc_marker = '',
                    max_name_length = 18,
                    max_prefix_length = 15,
                    truncate_names = true,
                    tab_size = 18,
                    diagnostics = 'nvim_lsp',
                    diagnostics_update_in_insert = false,
                    offsets = {
                        {
                            filetype = 'NvimTree',
                            text = 'File Explorer',
                            text_align = 'center',
                            separator = true,
                        },
                    },
                    color_icons = true,
                    show_buffer_icons = true,
                    show_buffer_close_icons = true,
                    show_close_icon = false,
                    show_tab_indicators = true,
                    show_duplicate_prefix = true,
                    persist_buffer_sort = true,
                    separator_style = 'slant',
                    enforce_regular_tabs = false,
                    always_show_bufferline = true,
                    hover = {
                        enabled = true,
                        delay = 200,
                        reveal = { 'close' },
                    },
                    sort_by = 'insert_after_current',
                },
            })
        end,
    },

    -- Status line - Lualine (modern replacement for vim-airline)
    {
        'nvim-lualine/lualine.nvim',
        event = "VeryLazy",
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            local colors = require('catppuccin.palettes').get_palette('mocha')
            require('lualine').setup({
                options = {
                    theme = 'catppuccin',
                    component_separators = '|',
                    section_separators = { left = '', right = '' },
                    globalstatus = true,
                },
                sections = {
                    lualine_a = {
                        { 'mode', separator = { left = '' }, right_padding = 2 },
                    },
                    lualine_b = { 'filename', 'branch' },
                    lualine_c = {
                        {
                            'diagnostics',
                            sources = { 'nvim_diagnostic' },
                            symbols = { error = ' ', warn = ' ', info = ' ' },
                        },
                        {
                            'diff',
                            colored = true,
                            symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
                        },
                    },
                    lualine_x = {
                        {
                            require('lazy.status').updates,
                            cond = require('lazy.status').has_updates,
                            color = { fg = colors.green },
                        },
                        'encoding',
                        'fileformat',
                        'filetype',
                    },
                    lualine_y = { 'progress' },
                    lualine_z = {
                        { 'location', separator = { right = '' }, left_padding = 2 },
                    },
                },
                inactive_sections = {
                    lualine_a = { 'filename' },
                    lualine_b = {},
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = { 'location' },
                },
                tabline = {},
                extensions = { 'nvim-tree', 'lazy' },
            })
        end,
    },

    -- Icons (required by various plugins)
    {
        'nvim-tree/nvim-web-devicons',
        lazy = true,
    },

    -- Legacy vim-devicons for NERDTree compatibility (can be removed later)
    {
        'ryanoasis/vim-devicons',
        event = "VeryLazy",
    },

    -- Indentation guides
    {
        'lukas-reineke/indent-blankline.nvim',
        event = "VeryLazy",
        main = 'ibl',
        config = function()
            require('ibl').setup({
                indent = {
                    char = '│',
                    tab_char = '│',
                },
                scope = { enabled = false },
                exclude = {
                    filetypes = {
                        'help',
                        'startify',
                        'dashboard',
                        'packer',
                        'neogitstatus',
                        'NvimTree',
                        'Trouble',
                        'alpha',
                    },
                },
            })
        end,
    },

    -- Dashboard (NvChad style)
    {
        'goolord/alpha-nvim',
        event = "VimEnter",
        config = function()
            local alpha = require('alpha')
            local dashboard = require('alpha.themes.dashboard')

            dashboard.section.header.val = {
                [[                               __                ]],
                [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
                [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
                [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
                [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
                [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
            }

            dashboard.section.buttons.val = {
                dashboard.button('f', ' ' .. ' Find file', ':Telescope find_files <CR>'),
                dashboard.button('n', ' ' .. ' New file', ':ene <BAR> startinsert <CR>'),
                dashboard.button('r', ' ' .. ' Recent files', ':Telescope oldfiles <CR>'),
                dashboard.button('g', ' ' .. ' Find text', ':Telescope live_grep <CR>'),
                dashboard.button('c', ' ' .. ' Config', ':e $MYVIMRC <CR>'),
                dashboard.button('l', '󰒲 ' .. ' Lazy', ':Lazy<CR>'),
                dashboard.button('q', ' ' .. ' Quit', ':qa<CR>'),
            }

            local function footer()
                return 'chrisatmachine.com'
            end

            dashboard.section.footer.val = footer()

            dashboard.section.header.opts.hl = 'Include'
            dashboard.section.buttons.opts.hl = 'Keyword'
            dashboard.section.footer.opts.hl = 'Type'

            dashboard.opts.opts.noautocmd = true
            alpha.setup(dashboard.opts)
        end,
    },
}
