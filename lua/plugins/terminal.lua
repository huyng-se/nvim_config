return {
    {
        'voldikss/vim-floaterm',
        cmd = { 'FloatermNew', 'FloatermToggle', 'FloatermNext', 'FloatermPrev', 'FloatermKill' },
        keys = {
            { '<leader>to', ':FloatermNew<CR>', mode = {'n', 't'}, desc = 'Open new terminal' },
            { '<leader>tt', ':FloatermToggle<CR>', mode = {'n', 't'}, desc = 'Toggle terminal' },
            { '<leader>tn', ':FloatermNext<CR>', mode = {'n', 't'}, desc = 'Next terminal' },
            { '<leader>tp', ':FloatermPrev<CR>', mode = {'n', 't'}, desc = 'Previous terminal' },
            { '<leader>tk', ':FloatermKill<CR>:FloatermPrev<CR>', mode = {'n', 't'}, desc = 'Kill terminal' },
            { '<leader>tf', [[<C-\><C-n><C-W><Left>]], mode = {'n', 't'}, desc = 'Focus terminal' },
            { '<leader>gl', ":FloatermNew! --position=bottomright --height=0.95 --width=0.7 --title='GitLog' git lg<CR>", desc = 'Git log' },
        },
        config = function()
            -- Global variables configuration
            vim.g.floaterm_position = 'topright'
            vim.g.floaterm_width = 0.6
            vim.g.floaterm_height = 0.8
            vim.g.floaterm_title = 'Terminal $1/$2'
            vim.g.floaterm_wintype = 'float'
            vim.g.floaterm_rootmarkers = {'.pro'}
            
            -- Windows specific shell configuration
            if vim.fn.has('win32') == 1 then
                vim.g.floaterm_shell = 'powershell -nologo'
            end
            
            -- Set colors
            vim.api.nvim_set_hl(0, 'Floaterm', { bg = 'Grey15' })
            vim.api.nvim_set_hl(0, 'FloatermBorder', { fg = 'Orange', bg = 'DarkGreen' })
        end,
    },
}
