-- Additional plugins for better UX (NvChad style)

return {
    -- Auto pairs for brackets, quotes, etc.
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = function()
            require('nvim-autopairs').setup({
                check_ts = true,
                ts_config = {
                    lua = { 'string' },
                    javascript = { 'template_string' },
                    java = false,
                },
            })

            -- Integration with nvim-cmp
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            local cmp = require('cmp')
            cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
        end,
    },

    -- Smart commenting
    {
        'numToStr/Comment.nvim',
        keys = {
            { 'gcc', mode = 'n', desc = 'Comment toggle current line' },
            { 'gc', mode = { 'n', 'o' }, desc = 'Comment toggle linewise' },
            { 'gc', mode = 'x', desc = 'Comment toggle linewise (visual)' },
            { 'gbc', mode = 'n', desc = 'Comment toggle current block' },
            { 'gb', mode = { 'n', 'o' }, desc = 'Comment toggle blockwise' },
            { 'gb', mode = 'x', desc = 'Comment toggle blockwise (visual)' },
        },
        config = function()
            require('Comment').setup({
                padding = true,
                sticky = true,
                ignore = nil,
                toggler = {
                    line = 'gcc',
                    block = 'gbc',
                },
                opleader = {
                    line = 'gc',
                    block = 'gb',
                },
                extra = {
                    above = 'gcO',
                    below = 'gco',
                    eol = 'gcA',
                },
                mappings = {
                    basic = true,
                    extra = true,
                },
                pre_hook = nil,
                post_hook = nil,
            })
        end,
    },

    -- Which-key for keybinding hints
    {
        'folke/which-key.nvim',
        event = "VeryLazy",
        config = function()
            local wk = require('which-key')
            wk.setup({
                plugins = {
                    marks = true,
                    registers = true,
                    spelling = {
                        enabled = true,
                        suggestions = 20,
                    },
                    presets = {
                        operators = false,
                        motions = false,
                        text_objects = false,
                        windows = false,
                        nav = false,
                        z = false,
                        g = false,
                    },
                },
                operators = { gc = "Comments" },
                key_labels = {},
                icons = {
                    breadcrumb = "»",
                    separator = "➜",
                    group = "+",
                },
                popup_mappings = {
                    scroll_down = "<c-d>",
                    scroll_up = "<c-u>",
                },
                window = {
                    border = "rounded",
                    position = "bottom",
                    margin = { 1, 0, 1, 0 },
                    padding = { 2, 2, 2, 2 },
                    winblend = 0,
                },
                layout = {
                    height = { min = 4, max = 25 },
                    width = { min = 20, max = 50 },
                    spacing = 3,
                    align = "left",
                },
                ignore_missing = true,
                hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
                show_help = true,
                show_keys = true,
                triggers = "auto",
                triggers_blacklist = {
                    i = { "j", "k" },
                    v = { "j", "k" },
                },
            })

            -- Register keymaps
            wk.register({
                ["<leader>"] = {
                    b = { name = "+buffer" },
                    c = { name = "+code" },
                    d = { name = "+debug" },
                    f = { name = "+file/find" },
                    g = { name = "+git" },
                    h = { name = "+help" },
                    l = { name = "+lsp" },
                    n = { name = "+notes" },
                    p = { name = "+project" },
                    q = { name = "+quit/session" },
                    r = { name = "+run" },
                    s = { name = "+search" },
                    t = { name = "+terminal" },
                    u = { name = "+ui" },
                    w = { name = "+window" },
                    x = { name = "+diagnostics/quickfix" },
                },
            })
        end,
    },

    -- Better notifications
    {
        'rcarriga/nvim-notify',
        config = function()
            require('notify').setup({
                background_colour = '#000000',
                fps = 30,
                icons = {
                    DEBUG = '',
                    ERROR = '',
                    INFO = '',
                    TRACE = '✎',
                    WARN = '',
                },
                level = 2,
                minimum_width = 50,
                render = 'default',
                stages = 'fade_in_slide_out',
                timeout = 5000,
                top_down = true,
                -- Disable animations to avoid conflicts
                on_open = nil,
                on_close = nil,
            })
            -- Always override vim.notify for better notifications
            vim.notify = require('notify')
        end,
    },

    -- Todo comments
    {
        'folke/todo-comments.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        cmd = { 'TodoQuickFix', 'TodoLocList', 'TodoTrouble', 'TodoTelescope' },
        event = { 'BufReadPost', 'BufNewFile' },
        config = function()
            require('todo-comments').setup({
                signs = true,
                sign_priority = 8,
                keywords = {
                    FIX = {
                        icon = ' ',
                        color = 'error',
                        alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' },
                    },
                    TODO = { icon = ' ', color = 'info' },
                    HACK = { icon = ' ', color = 'warning' },
                    WARN = { icon = ' ', color = 'warning', alt = { 'WARNING', 'XXX' } },
                    PERF = { icon = ' ', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
                    NOTE = { icon = ' ', color = 'hint', alt = { 'INFO' } },
                    TEST = { icon = '⏲ ', color = 'test', alt = { 'TESTING', 'PASSED', 'FAILED' } },
                },
                gui_style = {
                    fg = 'NONE',
                    bg = 'BOLD',
                },
                merge_keywords = true,
                highlight = {
                    multiline = true,
                    multiline_pattern = '^.',
                    multiline_context = 10,
                    before = '',
                    keyword = 'wide',
                    after = 'fg',
                    pattern = [[.*<(KEYWORDS)\s*:]],
                    comments_only = true,
                    max_line_len = 400,
                    exclude = {},
                },
                colors = {
                    error = { 'DiagnosticError', 'ErrorMsg', '#DC2626' },
                    warning = { 'DiagnosticWarn', 'WarningMsg', '#FBBF24' },
                    info = { 'DiagnosticInfo', '#2563EB' },
                    hint = { 'DiagnosticHint', '#10B981' },
                    default = { 'Identifier', '#7C3AED' },
                    test = { 'Identifier', '#FF00FF' },
                },
                search = {
                    command = 'rg',
                    args = {
                        '--color=never',
                        '--no-heading',
                        '--with-filename',
                        '--line-number',
                        '--column',
                    },
                    pattern = [[\b(KEYWORDS):]],
                },
            })
        end,
    },
}