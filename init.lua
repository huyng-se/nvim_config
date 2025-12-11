-- init.lua - Entry point for Neovim configuration
-- Migrated from vim-plug to lazy.nvim with modern structure

print('Neovim started...')

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    print("Installing lazy.nvim...")
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
    print("lazy.nvim installed!")
end
vim.opt.rtp:prepend(lazypath)

-- Load configuration modules in order
require('config.options')   -- Vim options and settings
require('config.keymaps')   -- Key mappings
require('config.autocmds')  -- Autocommands

-- Setup lazy.nvim and load plugins
require("lazy").setup("plugins", {
    defaults = {
        lazy = false, -- Plugins are not lazy-loaded by default
        version = false, -- Don't try to load specific versions unless specified
    },
    install = {
        colorscheme = { "darcula", "habamax" }, -- Try to load these on install
    },
    checker = {
        enabled = true, -- Automatically check for plugin updates
        notify = false, -- Don't notify about updates
    },
    performance = {
        rtp = {
            -- Disable some rtp plugins we don't need
            disabled_plugins = {
                "gzip",
                "matchit",
                "matchparen",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})
