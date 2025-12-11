-- Autocommands configuration
-- Migrated from init.lua with simplifications

-- Auto reload content changed outside
local auto_reload_group = vim.api.nvim_create_augroup("AutoReload", { clear = true })

vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
    group = auto_reload_group,
    pattern = "*",
    command = "checktime",
    desc = "Check if file needs to be reloaded"
})

vim.api.nvim_create_autocmd("FileChangedShellPost", {
    group = auto_reload_group,
    pattern = "*",
    callback = function()
        vim.api.nvim_command("echohl WarningMsg")
        vim.api.nvim_command('echo "File changed on disk. Buffer reloaded."')
        vim.api.nvim_command("echohl None")
    end,
    desc = "Notification when file is reloaded"
})

-- Disable automatic comment continuation
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
    desc = "Disable automatic comment on newline"
})

-- JSON folding
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = "*.json",
    command = "set foldmethod=indent",
    desc = "Use indent folding for JSON files"
})

-- Highlight on yank (NEW - UX improvement)
vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
    end,
    desc = "Highlight yanked text briefly"
})

-- Auto-close split window when buffer is deleted
-- This prevents empty split windows from remaining after buffer deletion
vim.api.nvim_create_autocmd("BufDelete", {
    pattern = "*",
    callback = function(args)
        -- Get the buffer being deleted
        local buf = args.buf
        
        -- Check if the buffer is displayed in any window
        local windows = vim.fn.win_findbuf(buf)
        
        -- If buffer is in windows and there are multiple windows, close the window
        if #windows > 0 and vim.fn.winnr('$') > 1 then
            for _, win in ipairs(windows) do
                -- Check if this is a normal window (not special like NERDTree)
                local win_buf = vim.api.nvim_win_get_buf(win)
                local buftype = vim.api.nvim_buf_get_option(win_buf, 'buftype')
                
                -- Only close normal file windows
                if buftype == '' then
                    vim.api.nvim_win_close(win, false)
                end
            end
        end
    end,
    desc = "Auto-close split window when buffer is deleted"
})
