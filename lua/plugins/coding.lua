return {
    -- Mason: LSP installer
    {
        'williamboman/mason.nvim',
        cmd = { 'Mason', 'MasonInstall', 'MasonUpdate' },
        opts = {
            ui = {
                border = "rounded",
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        },
        config = function(_, opts)
            require('mason').setup(opts)
        end,
    },

    -- Mason LSP config bridge
    {
        'williamboman/mason-lspconfig.nvim',
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            'williamboman/mason.nvim',
            'neovim/nvim-lspconfig',
            'hrsh7th/cmp-nvim-lsp',
        },
        config = function()
            local mason_lspconfig = require('mason-lspconfig')
            
            -- Setup capabilities for nvim-cmp
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            
            -- Helper function to set up keymaps on attach
            local on_attach = function(client, bufnr)
                local map = function(keys, func, desc)
                    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc, silent = true })
                end
                
                map('gd', vim.lsp.buf.definition, 'Go to definition')
                map('gy', vim.lsp.buf.type_definition, 'Go to type definition')
                map('gi', vim.lsp.buf.implementation, 'Go to implementation')
                map('gr', vim.lsp.buf.references, 'Show references')
                map('K', vim.lsp.buf.hover, 'Hover documentation')
                map('<leader>rn', vim.lsp.buf.rename, 'Rename symbol')
                map('<leader>ca', vim.lsp.buf.code_action, 'Code action') -- Changed to ca for standard
                map('<leader>cf', vim.lsp.buf.format, 'Format code') -- Changed to cf
                
                -- Diagnostics
                map('[d', vim.diagnostic.goto_prev, 'Previous diagnostic')
                map(']d', vim.diagnostic.goto_next, 'Next diagnostic')
            end

            mason_lspconfig.setup({
                ensure_installed = { 'lua_ls', 'clangd', 'cmake', 'pyright' },
                automatic_installation = true,
                handlers = {
                    function(server_name)
                        require('lspconfig')[server_name].setup({
                            capabilities = capabilities,
                            on_attach = on_attach,
                        })
                    end,
                    
                    -- Custom settings cho Lua
                    ['lua_ls'] = function()
                        require('lspconfig').lua_ls.setup({
                            capabilities = capabilities,
                            on_attach = on_attach,
                            settings = {
                                Lua = {
                                    diagnostics = { globals = { 'vim' } },
                                    workspace = { checkThirdParty = false },
                                    telemetry = { enable = false },
                                },
                            },
                        })
                    end,
                    
                    -- Custom settings cho Clangd
                    ['clangd'] = function()
                        require('lspconfig').clangd.setup({
                            capabilities = capabilities,
                            on_attach = on_attach,
                            cmd = {
                                "clangd",
                                "--background-index",
                                "--clang-tidy",
                                "--header-insertion=iwyu",
                            },
                        })
                    end,
                },
            })
            
            -- UI Tweaks for Diagnostics
            vim.diagnostic.config({
                virtual_text = true,
                float = { border = 'rounded' },
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = "✖",
                        [vim.diagnostic.severity.WARN] = "⚠",
                        [vim.diagnostic.severity.HINT] = "➤",
                        [vim.diagnostic.severity.INFO] = "ℹ",
                    },
                },
            })
        end,
    },

    {
        'hrsh7th/nvim-cmp',
        event = "InsertEnter",
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets',
        },
        config = function()
            local cmp = require('cmp')
            local luasnip = require('luasnip')
            require('luasnip.loaders.from_vscode').lazy_load()
            
            cmp.setup({
                snippet = {
                    expand = function(args) luasnip.lsp_expand(args.body) end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump()
                        else fallback() end
                    end, { 'i', 's' }),
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then luasnip.jump(-1)
                        else fallback() end
                    end, { 'i', 's' }),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp', priority = 1000 },
                    { name = 'luasnip', priority = 750 },
                    { name = 'path' },
                }, {
                    { name = 'buffer' },
                }),
            })
        end,
    },

    {
        'zbirenbaum/copilot.lua',
        cmd = 'Copilot',
        event = 'InsertEnter',
        config = function()
            require('copilot').setup({
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                    debounce = 75,
                    keymap = {
                        accept = "<M-l>",
                        accept_word = false,
                        accept_line = false,
                        next = "<M-]>",        -- Alt + ] để xem gợi ý tiếp theo
                        prev = "<M-[>",        -- Alt + [ để xem gợi ý trước
                        dismiss = "<C-]>",
                    },
                },
                panel = { enabled = false },
                filetypes = {
                    yaml = false,
                    markdown = false,
                    help = false,
                    gitcommit = false,
                    gitrebase = false,
                    hgcommit = false,
                    svn = false,
                    cvs = false,
                    ["."] = false,
                },
            })
        end,
    },

    {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "canary",
        dependencies = {
            { "zbirenbaum/copilot.lua" },
            { "nvim-lua/plenary.nvim" },
        },
        build = "make tiktoken",
        opts = {
            debug = false,
            window = {
                layout = 'float',
                width = 0.8,
                height = 0.8,
            },
        },
        keys = {
            { "<leader>cc", ":CopilotChatToggle<CR>", desc = "Copilot: Toggle Chat" },
            { "<leader>ce", ":CopilotChatExplain<CR>", desc = "Copilot: Explain Code" },
            { "<leader>cf", ":CopilotChatFix<CR>", desc = "Copilot: Fix Code" },
            { "<leader>ct", ":CopilotChatTests<CR>", desc = "Copilot: Generate Tests" },
        },
    },

    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },
    {
        'numToStr/Comment.nvim',
        event = { "BufReadPost", "BufNewFile" },
        config = true
    },
}
