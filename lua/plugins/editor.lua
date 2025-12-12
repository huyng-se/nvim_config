-- Editor plugins: file explorer, fuzzy finder

return {
    {
        'nvim-tree/nvim-tree.lua',
        cmd = { 'NvimTreeToggle', 'NvimTreeFocus', 'NvimTreeFindFile', 'NvimTreeCollapse' },
        keys = {
            { '<F5>', ':NvimTreeToggle<CR>', desc = 'Toggle NvimTree' },
            { '<leader>e', ':NvimTreeToggle<CR>', desc = 'Toggle NvimTree' },
            { '<leader>o', ':NvimTreeFocus<CR>', desc = 'Focus NvimTree' },
        },
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('nvim-tree').setup({
                auto_reload_on_write = true,
                disable_netrw = false,
                hijack_cursor = false,
                hijack_netrw = false, -- Disable hijacking to prevent auto-opening file dialogs
                hijack_unnamed_buffer_when_opening = false,
                sort = {
                    sorter = 'name',
                    folders_first = true,
                    files_first = false,
                },
                root_dirs = {},
                prefer_startup_root = false,
                sync_root_with_cwd = true,
                reload_on_bufenter = false,
                respect_buf_cwd = false,
                on_attach = 'default',
                select_prompts = false,
                view = {
                    adaptive_size = false,
                    centralize_selection = true,
                    width = 30,
                    side = 'left',
                    preserve_window_proportions = false,
                    number = false,
                    relativenumber = false,
                    signcolumn = 'yes',
                    float = {
                        enable = false,
                        quit_on_focus_loss = true,
                        open_win_config = {
                            relative = 'editor',
                            border = 'rounded',
                            width = 30,
                            height = 30,
                            row = 1,
                            col = 1,
                        },
                    },
                },
                renderer = {
                    add_trailing = false,
                    group_empty = false,
                    highlight_git = true,
                    full_name = false,
                    highlight_opened_files = 'none',
                    highlight_modified = 'none',
                    root_folder_label = ':~:s?$?/..?',
                    indent_width = 2,
                    indent_markers = {
                        enable = true,
                        inline_arrows = true,
                        icons = {
                            corner = '└',
                            edge = '│',
                            item = '│',
                            bottom = '─',
                            none = ' ',
                        },
                    },
                    icons = {
                        webdev_colors = true,
                        git_placement = 'before',
                        modified_placement = 'after',
                        padding = ' ',
                        symlink_arrow = ' ➛ ',
                        show = {
                            file = true,
                            folder = true,
                            folder_arrow = true,
                            git = true,
                            modified = true,
                            diagnostics = true,
                            bookmarks = true,
                        },
                        glyphs = {
                            default = '',
                            symlink = '',
                            bookmark = '󰆤',
                            modified = '●',
                            folder = {
                                arrow_closed = '',
                                arrow_open = '',
                                default = '',
                                open = '',
                                empty = '',
                                empty_open = '',
                                symlink = '',
                                symlink_open = '',
                            },
                            git = {
                                unstaged = '✗',
                                staged = '✓',
                                unmerged = '',
                                renamed = '➜',
                                untracked = '★',
                                deleted = '',
                                ignored = '◌',
                            },
                        },
                    },
                    special_files = { 'Cargo.toml', 'Makefile', 'README.md', 'readme.md' },
                    symlink_destination = true,
                },
                hijack_directories = {
                    enable = true,
                    auto_open = true,
                },
                update_focused_file = {
                    enable = true,
                    update_root = true,
                    ignore_list = {},
                },
                system_open = {
                    cmd = '',
                    args = {},
                },
                diagnostics = {
                    enable = true,
                    show_on_dirs = false,
                    show_on_open_dirs = true,
                    debounce_delay = 50,
                    severity = {
                        min = vim.diagnostic.severity.HINT,
                        max = vim.diagnostic.severity.ERROR,
                    },
                    icons = {
                        hint = '',
                        info = '',
                        warning = '',
                        error = '',
                    },
                },
                filters = {
                    dotfiles = false,
                    git_clean = false,
                    no_buffer = false,
                    custom = {},
                    exclude = {},
                },
                filesystem_watchers = {
                    enable = true,
                    debounce_delay = 50,
                    ignore_dirs = {},
                },
                git = {
                    enable = true,
                    ignore = true,
                    show_on_dirs = true,
                    show_on_open_dirs = true,
                    timeout = 200,
                },
                modified = {
                    enable = false,
                    show_on_dirs = true,
                    show_on_open_dirs = true,
                },
                actions = {
                    use_system_clipboard = true,
                    change_dir = {
                        enable = true,
                        global = false,
                        restrict_above_cwd = false,
                    },
                    expand_all = {
                        max_folder_discovery = 300,
                        exclude = {},
                    },
                    file_popup = {
                        open_win_config = {
                            col = 1,
                            row = 1,
                            relative = 'cursor',
                            border = 'shadow',
                            style = 'minimal',
                        },
                    },
                    open_file = {
                        quit_on_open = false,
                        resize_window = true,
                        window_picker = {
                            enable = true,
                            picker = 'default',
                            chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890',
                            exclude = {
                                filetype = { 'notify', 'packer', 'qf', 'diff', 'fugitive', 'fugitiveblame' },
                                buftype = { 'nofile', 'terminal', 'help' },
                            },
                        },
                    },
                    remove_file = {
                        close_window = true,
                    },
                },
                trash = {
                    cmd = 'gio trash',
                },
                live_filter = {
                    prefix = '[FILTER]: ',
                    always_show_folders = true,
                },
                tab = {
                    sync = {
                        open = false,
                        close = false,
                        ignore = {},
                    },
                },
                notify = {
                    threshold = vim.log.levels.INFO,
                },
                ui = {
                    confirm = {
                        remove = true,
                        trash = true,
                    },
                },
                experimental = {
                    git = {
                        async = false,
                    },
                },
                log = {
                    enable = false,
                    truncate = false,
                    types = {
                        all = false,
                        config = false,
                        copy_paste = false,
                        dev = false,
                        diagnostics = false,
                        git = false,
                        profile = false,
                        watcher = false,
                    },
                },
            })
        end,
    },

    -- Fuzzy finder - Telescope (modern replacement for FZF)
    {
        'nvim-telescope/telescope.nvim',
        cmd = 'Telescope',
        keys = {
            { '<F6>', ':Telescope find_files<CR>', desc = 'Find files' },
            { '<leader>ff', ':Telescope find_files<CR>', desc = 'Find files' },
            { '<leader>fg', ':Telescope live_grep<CR>', desc = 'Live grep' },
            { '<leader>fb', ':Telescope buffers<CR>', desc = 'Find buffers' },
            { '<leader>fh', ':Telescope help_tags<CR>', desc = 'Help tags' },
            { '<leader>fo', ':Telescope oldfiles<CR>', desc = 'Recent files' },
            { '<leader>fk', ':Telescope keymaps<CR>', desc = 'Keymaps' },
            { '<leader>fc', ':Telescope commands<CR>', desc = 'Commands' },
        },
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
            },
            "nvim-telescope/telescope-ui-select.nvim", -- THÊM DÒNG NÀY
        },
        config = function()
            local telescope = require('telescope')
            local actions = require('telescope.actions')

            telescope.setup({
                defaults = {
                    prompt_prefix = '   ',
                    selection_caret = '  ',
                    entry_prefix = '  ',
                    initial_mode = 'insert',
                    selection_strategy = 'reset',
                    sorting_strategy = 'ascending',
                    layout_strategy = 'horizontal',
                    layout_config = {
                        horizontal = {
                            prompt_position = 'top',
                            preview_width = 0.55,
                            results_width = 0.8,
                        },
                        vertical = {
                            mirror = false,
                        },
                        width = 0.87,
                        height = 0.80,
                        preview_cutoff = 120,
                    },
                    file_sorter = require('telescope.sorters').get_fuzzy_file,
                    file_ignore_patterns = { 'node_modules' },
                    generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
                    path_display = { 'truncate' },
                    winblend = 5, -- Lighter transparency for light theme
                    border = {},
                    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
                    color_devicons = true,
                    set_env = { ['COLORTERM'] = 'truecolor' },
                    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
                    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
                    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
                    buffer_previewer_maker = require('telescope.previewers').buffer_previewer_maker,
                    mappings = {
                        i = {
                            ['<C-n>'] = actions.cycle_history_next,
                            ['<C-p>'] = actions.cycle_history_prev,
                            ['<C-j>'] = actions.move_selection_next,
                            ['<C-k>'] = actions.move_selection_previous,
                            ['<C-c>'] = actions.close,
                            ['<Down>'] = actions.move_selection_next,
                            ['<Up>'] = actions.move_selection_previous,
                            ['<CR>'] = actions.select_default,
                            ['<C-x>'] = actions.select_horizontal,
                            ['<C-v>'] = actions.select_vertical,
                            ['<C-t>'] = actions.select_tab,
                            ['<C-u>'] = actions.preview_scrolling_up,
                            ['<C-d>'] = actions.preview_scrolling_down,
                            ['<PageUp>'] = actions.results_scrolling_up,
                            ['<PageDown>'] = actions.results_scrolling_down,
                            ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
                            ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
                            ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
                            ['<M-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
                            ['<C-l>'] = actions.complete_tag,
                            ['<C-w>'] = { '<c-s-w>', type = 'command' },
                            ['<C-_>'] = actions.which_key,
                        },
                        n = {
                            ['<esc>'] = actions.close,
                            ['<CR>'] = actions.select_default,
                            ['<C-x>'] = actions.select_horizontal,
                            ['<C-v>'] = actions.select_vertical,
                            ['<C-t>'] = actions.select_tab,
                            ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
                            ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
                            ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
                            ['<M-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
                            ['j'] = actions.move_selection_next,
                            ['k'] = actions.move_selection_previous,
                            ['H'] = actions.move_to_top,
                            ['M'] = actions.move_to_middle,
                            ['L'] = actions.move_to_bottom,
                            ['<Down>'] = actions.move_selection_next,
                            ['<Up>'] = actions.move_selection_previous,
                            ['gg'] = actions.move_to_top,
                            ['G'] = actions.move_to_bottom,
                            ['<C-u>'] = actions.preview_scrolling_up,
                            ['<C-d>'] = actions.preview_scrolling_down,
                            ['<PageUp>'] = actions.results_scrolling_up,
                            ['<PageDown>'] = actions.results_scrolling_down,
                            ['?'] = actions.which_key,
                        },
                    },
                },
                pickers = {
                    find_files = {
                        theme = 'dropdown',
                    },
                    live_grep = {
                        theme = 'dropdown',
                    },
                    buffers = {
                        theme = 'dropdown',
                    },
                    help_tags = {
                        theme = 'dropdown',
                    },
                },
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = 'smart_case',
                    },
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                            -- Tùy chỉnh theme cho menu select
                        }
                    }
                },
            })

            -- Load extensions
            telescope.load_extension('fzf')
            telescope.load_extension('ui-select') -- THÊM DÒNG NÀY
        end,
    },
}
