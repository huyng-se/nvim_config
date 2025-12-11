local map = vim.keymap.set

local opts = { silent = true }

map('n', '<Leader>dl', ':call vimspector#Launch()<CR>', vim.tbl_extend('force', opts, { desc = 'Vimspector: Launch' }))
map('n', '<Leader>ds', ':call vimspector#Reset()<CR>', vim.tbl_extend('force', opts, { desc = 'Vimspector: Reset' }))
map('n', '<Leader>dc', ':call vimspector#Continue()<CR>', vim.tbl_extend('force', opts, { desc = 'Vimspector: Continue' }))

map('n', '<Leader>dt', ':call vimspector#ToggleBreakpoint()<CR>', vim.tbl_extend('force', opts, { desc = 'Vimspector: Toggle Breakpoint' }))
map('n', '<Leader>dT', ':call vimspector#ClearBreakpoints()<CR>', vim.tbl_extend('force', opts, { desc = 'Vimspector: Clear Breakpoints' }))

local plug_opts = { silent = true, remap = true }

map('n', '<Leader>dr', '<Plug>VimspectorRestart', vim.tbl_extend('force', plug_opts, { desc = 'Vimspector: Restart' }))
map('n', '<Leader>de', '<Plug>VimspectorStepOut', vim.tbl_extend('force', plug_opts, { desc = 'Vimspector: Step Out' }))
map('n', '<Leader>di', '<Plug>VimspectorStepInto', vim.tbl_extend('force', plug_opts, { desc = 'Vimspector: Step Into' }))
map('n', '<Leader>do', '<Plug>VimspectorStepOver', vim.tbl_extend('force', plug_opts, { desc = 'Vimspector: Step Over' }))
