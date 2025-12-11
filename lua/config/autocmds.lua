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
