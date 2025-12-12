return {
    {
        'puremourning/vimspector',
        cmd = { 'VimspectorInstall', 'VimspectorUpdate' },
        keys = {
            { '<Leader>dl', ':call vimspector#Launch()<CR>', desc = 'Vimspector: Launch' },
            { '<Leader>ds', ':call vimspector#Reset()<CR>', desc = 'Vimspector: Reset' },
            { '<Leader>dc', ':call vimspector#Continue()<CR>', desc = 'Vimspector: Continue' },
            { '<Leader>dt', ':call vimspector#ToggleBreakpoint()<CR>', desc = 'Vimspector: Toggle Breakpoint' },
            { '<Leader>dT', ':call vimspector#ClearBreakpoints()<CR>', desc = 'Vimspector: Clear Breakpoints' },
            { '<Leader>dr', '<Plug>VimspectorRestart', desc = 'Vimspector: Restart', remap = true },
            { '<Leader>de', '<Plug>VimspectorStepOut', desc = 'Vimspector: Step Out', remap = true },
            { '<Leader>di', '<Plug>VimspectorStepInto', desc = 'Vimspector: Step Into', remap = true },
            { '<Leader>do', '<Plug>VimspectorStepOver', desc = 'Vimspector: Step Over', remap = true },
        },
    },
}
