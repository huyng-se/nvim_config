-- Treesitter for syntax highlighting
-- Replaces vim-polyglot and rust.vim

return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require('nvim-treesitter.configs').setup({
                -- List of parsers to install
                ensure_installed = {
                    "lua",
                    "rust",
                    "cpp",
                    "c",
                    "python",
                    "json",
                    "html",
                    "css",
                    "javascript",
                    "typescript",
                    "cmake",
                    "vim",
                    "vimdoc",
                    "bash",
                    "markdown",
                    "markdown_inline",
                },
                
                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,
                
                -- Automatically install missing parsers when entering buffer
                auto_install = true,
                
                -- Highlight
                highlight = {
                    enable = true,
                    -- Disable for very large files
                    disable = function(lang, buf)
                        local max_filesize = 100 * 1024 -- 100 KB
                        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                        if ok and stats and stats.size > max_filesize then
                            return true
                        end
                    end,
                    additional_vim_regex_highlighting = false,
                },
                
                -- Indentation
                indent = {
                    enable = true,
                },
                
                -- Incremental selection
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = '<CR>',
                        node_incremental = '<CR>',
                        scope_incremental = '<TAB>',
                        node_decremental = '<BS>',
                    },
                },
            })
        end,
    },
}
