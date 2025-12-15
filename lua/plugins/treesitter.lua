return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            -- Ensure a compiler is available (important for MacOS where gcc is often clang)
            require('nvim-treesitter.install').compilers = { "clang", "gcc" }

            require("nvim-treesitter.configs").setup({
                ensure_installed = { "lua", "vim", "vimdoc", "c", "cpp", "python", "rust" },
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = { enable = true },
            })
        end,
    }
}