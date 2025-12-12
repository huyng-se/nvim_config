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

    -- Better notifications
    {
        'rcarriga/nvim-notify',
        config = function()
            require('notify').setup({
                background_colour = '#eff1f5', -- Match catppuccin latte background
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
                timeout = 2000,
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
        event = { 'BufReadPost', 'BufNewFile' },
        opts = {},
        -- Phím tắt để tìm nhanh TODO
        keys = {
            { "]t", function() require("todo-comments").jump_next() end, desc = "Next Todo Comment" },
            { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous Todo Comment" },
            { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find Todo" },
        },
    },
}