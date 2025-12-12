-- UI plugins: theme, bufferline, statusline, icons

return {
    -- Color scheme - OneDark (Dark theme)
    {
        'navarasu/onedark.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('onedark').setup({
                style = 'dark', -- dark, darker, cool, deep, warm, warmer
                transparent = false,
                term_colors = true,
                ending_tildes = false,
                cmp_itemkind_reverse = false,
                toggle_style_key = nil,
                toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer'},
                code_style = {
                    comments = 'none',
                    keywords = 'none',
                    functions = 'none',
                    strings = 'none',
                    variables = 'none'
                },
                lualine = {
                    transparent = false,
                },
                colors = {},
                highlights = {
                    -- Better contrast for dialogs and popups
                    Pmenu = { fg = '#abb2bf', bg = '#21252b' },
                    PmenuSel = { fg = '#282c34', bg = '#61afef' },
                    PmenuSbar = { bg = '#181a1f' },
                    PmenuThumb = { bg = '#61afef' },

                    -- Terminal with better contrast
                    Terminal = { fg = '#abb2bf', bg = '#282c34' },

                    -- Improve line numbers and cursor line
                    CursorLine = { bg = '#21252b' },
                    LineNr = { fg = '#5c6370' },
                    CursorLineNr = { fg = '#61afef', style = 'bold' },

                    -- Better fold colors
                    Folded = { fg = '#5c6370', bg = '#21252b' },
                    FoldColumn = { fg = '#5c6370', bg = '#282c34' },
                },
                diagnostics = {
                    darker = true,
                    undercurl = true,
                    background = true,
                },
            })
            require('onedark').load()
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
            require('lualine').setup({
                options = {
                    theme = 'onedark',
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
                            color = { fg = "#98c379" },
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
                scope = {
                    enabled = true, -- BẬT LÊN
                    show_start = true,
                    show_end = false,
                },
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

            -- Auto-show dashboard only when no file is opened
            vim.api.nvim_create_autocmd("VimEnter", {
                callback = function()
                    -- Only show dashboard if no file is opened (no args or directory)
                    local should_show = vim.fn.argc() == 0 or 
                                       (vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1)
                    
                    -- Don't show if we have a readable file buffer
                    local has_file = false
                    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                        if vim.api.nvim_buf_is_loaded(buf) and 
                           vim.api.nvim_buf_get_option(buf, 'buftype') == '' and
                           vim.fn.filereadable(vim.api.nvim_buf_get_name(buf)) == 1 then
                            has_file = true
                            break
                        end
                    end
                    
                    if should_show and not has_file then
                        alpha.start(false)
                    end
                end,
            })
        end,
    },

    -- Noice for better UI notifications and command line
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify", -- Plugin tạo thông báo đẹp
        },
        opts = {
            lsp = {
                -- Ghi đè markdown rendering của LSP để dùng treesitter
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            presets = {
                bottom_search = true, -- Dùng command line ở dưới cho search (/), command (:) ở giữa
                command_palette = true, -- Đặt command palette ở vị trí trung tâm
                long_message_to_split = true, -- Tin nhắn dài gửi vào split window
                inc_rename = false, -- Cho phép rename trực quan
                lsp_doc_border = false, -- Thêm border cho docs
            },
        },
        config = function(_, opts)
            require("noice").setup(opts)
            -- Tắt intro message khi vào neovim để tránh conflict với Alpha dashboard
            vim.opt.shortmess:append("I") 
        end
    },
}
