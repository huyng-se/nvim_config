-- Coding plugins: LSP, completion, snippets
-- Replacing COC.nvim with native LSP

return {
    -- Mason: LSP installer
    {
        'williamboman/mason.nvim',
        cmd = { 'Mason', 'MasonInstall', 'MasonUninstall', 'MasonUninstallAll', 'MasonLog' },
        config = function()
            require('mason').setup({
                ui = {
                    border = "rounded",
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })
        end,
    },

    -- Mason LSP config bridge
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = {
            'williamboman/mason.nvim',
            'neovim/nvim-lspconfig',
        },
        config = function()
            require('mason-lspconfig').setup({
                -- Automatically install these language servers
                ensure_installed = {
                    'lua_ls',      -- Lua
                    'clangd',      -- C/C++
                    'cmake',       -- CMake
                    'pyright',     -- Python
                },
                automatic_installation = true,
            })
        end,
    },

    -- LSP Configuration
    {
        'neovim/nvim-lspconfig',
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'williamboman/mason-lspconfig.nvim',
        },
        config = function()
            local lspconfig = require('lspconfig')
            
            -- Setup capabilities for nvim-cmp
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            
            -- Common on_attach function for key mappings
            local on_attach = function(client, bufnr)
                local map = vim.keymap.set
                local opts = { buffer = bufnr, silent = true }
                
                -- LSP key mappings (similar to COC mappings)
                map('n', 'gd', vim.lsp.buf.definition, vim.tbl_extend('force', opts, { desc = 'Go to definition' }))
                map('n', 'gy', vim.lsp.buf.type_definition, vim.tbl_extend('force', opts, { desc = 'Go to type definition' }))
                map('n', 'gi', vim.lsp.buf.implementation, vim.tbl_extend('force', opts, { desc = 'Go to implementation' }))
                map('n', 'gr', vim.lsp.buf.references, vim.tbl_extend('force', opts, { desc = 'Show references' }))
                map('n', 'K', vim.lsp.buf.hover, vim.tbl_extend('force', opts, { desc = 'Hover documentation' }))
                map('n', '<leader>rn', vim.lsp.buf.rename, vim.tbl_extend('force', opts, { desc = 'Rename symbol' }))
                map('n', '<leader>f', vim.lsp.buf.format, vim.tbl_extend('force', opts, { desc = 'Format code' }))
                map('n', '<leader>a', vim.lsp.buf.code_action, vim.tbl_extend('force', opts, { desc = 'Code action' }))
                map('v', '<leader>a', vim.lsp.buf.code_action, vim.tbl_extend('force', opts, { desc = 'Code action' }))
                
                -- Diagnostic navigation
                map('n', '[g', vim.diagnostic.goto_prev, vim.tbl_extend('force', opts, { desc = 'Previous diagnostic' }))
                map('n', ']g', vim.diagnostic.goto_next, vim.tbl_extend('force', opts, { desc = 'Next diagnostic' }))
            end
            
            -- C/C++ (clangd replaces ccls)
            lspconfig.clangd.setup({
                capabilities = capabilities,
                on_attach = on_attach,
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--header-insertion=iwyu",
                    "--completion-style=detailed",
                    "--function-arg-placeholders",
                },
            })
            
            -- CMake
            lspconfig.cmake.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })
            
            -- Python (pyright)
            lspconfig.pyright.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })
            
            -- Lua (for Neovim configuration)
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        },
                        telemetry = { enable = false },
                    },
                },
            })
            
            -- Diagnostic configuration
            vim.diagnostic.config({
                virtual_text = true,
                signs = true,
                update_in_insert = false,
                underline = true,
                severity_sort = true,
                float = {
                    border = 'rounded',
                    source = 'always',
                },
            })
            
            -- Diagnostic signs
            local signs = { Error = "✖", Warn = "⚠", Hint = "➤", Info = "ℹ" }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end
        end,
    },

    -- Completion engine
    {
        'hrsh7th/nvim-cmp',
        event = "InsertEnter",
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',     -- LSP completions
            'hrsh7th/cmp-buffer',        -- Buffer completions
            'hrsh7th/cmp-path',          -- Path completions
            'hrsh7th/cmp-cmdline',       -- Command line completions
            'L3MON4D3/LuaSnip',          -- Snippet engine
            'saadparwaiz1/cmp_luasnip',  -- Snippet completions
            'rafamadriz/friendly-snippets', -- Snippet collection
        },
        config = function()
            local cmp = require('cmp')
            local luasnip = require('luasnip')
            
            -- Load friendly-snippets
            require('luasnip.loaders.from_vscode').lazy_load()
            
            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'crates' },
                }, {
                    { name = 'buffer' },
                    { name = 'path' },
                }),
                formatting = {
                    format = function(entry, vim_item)
                        -- Icons for completion items (similar to COC icons)
                        local icons = {
                            Text = "📝",
                            Method = "m",
                            Function = "ƒ",
                            Constructor = "",
                            Field = "",
                            Variable = "",
                            Class = "",
                            Interface = "",
                            Module = "",
                            Property = "",
                            Unit = "",
                            Value = "",
                            Enum = "",
                            Keyword = "",
                            Snippet = "",
                            Color = "",
                            File = "",
                            Reference = "",
                            Folder = "",
                            EnumMember = "",
                            Constant = "",
                            Struct = "",
                            Event = "",
                            Operator = "Ψ",
                            TypeParameter = "",
                        }
                        vim_item.kind = string.format('%s %s', icons[vim_item.kind] or "", vim_item.kind)
                        vim_item.menu = ({
                            nvim_lsp = "[LSP]",
                            luasnip = "[Snippet]",
                            buffer = "[Buffer]",
                            path = "[Path]",
                            crates = "[Crate]",
                        })[entry.source.name]
                        return vim_item
                    end
                },
            })
            
            -- Command line completion
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                    { name = 'cmdline' }
                })
            })
            
            -- Search completion
            cmp.setup.cmdline('/', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })
        end,
    },

    -- Snippet engine
    {
        'L3MON4D3/LuaSnip',
        lazy = true,
        dependencies = {
            'rafamadriz/friendly-snippets',
        },
    },

    -- Rust support (keep rustaceanvim)
    {
        'mrcjkb/rustaceanvim',
        version = '^5',
        ft = 'rust',
        config = function()
            vim.g.rustaceanvim = {
                server = {
                    on_attach = function(client, bufnr)
                        local map = vim.keymap.set
                        local opts = { buffer = bufnr, silent = true }
                        map("n", "K", function() vim.cmd.RustLsp { 'hover', 'actions' } end, opts)
                        map("n", "<leader>a", function() vim.cmd.RustLsp('codeAction') end, opts)
                        map("n", "gd", function() vim.lsp.buf.definition() end, opts)
                        map("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
                        map("n", "<leader>f", function() vim.lsp.buf.format() end, opts)
                    end,
                    
                    default_settings = {
                        ['rust-analyzer'] = {
                            check = {
                                command = "clippy",
                                features = "all",
                            },
                            cargo = {
                                allFeatures = true,
                            },
                            inlayHints = {
                                bindingModeHints = { enable = true },
                                typeHints = { enable = true },
                                chainingHints = { enable = true },
                                parameterHints = { enable = true },
                            },
                        },
                    },
                },
            }
            
            -- Auto format on save for Rust
            vim.g.rustfmt_autosave = 1
            vim.g.rustfmt_command = "rustfmt"
            vim.g.rustfmt_fail_silently = 0
        end,
    },

    -- Crates.nvim for Cargo.toml
    {
        'saecki/crates.nvim',
        event = { "BufRead Cargo.toml" },
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('crates').setup({
                completion = {
                    cmp = { enabled = true },
                },
                text = {
                    loading = "  Loading...",
                    version = "  %s",
                    prerelease = "  %s",
                    yanked = "  %s yanked",
                    nomatch = "  Not found",
                    upgrade = "  -> %s",
                    error = "  Error fetching crate",
                },
                highlight = {
                    loading = "Comment",
                    version = "String",
                    prerelease = "Special",
                    yanked = "Error",
                    nomatch = "Error",
                    upgrade = "Title",
                    error = "Error",
                },
            })
            
            -- Keymaps for Cargo.toml
            vim.api.nvim_create_autocmd("BufRead", {
                group = vim.api.nvim_create_augroup("Crates_Keymaps", { clear = true }),
                pattern = "Cargo.toml",
                callback = function()
                    local crates = require('crates')
                    local map = vim.keymap.set
                    local opts = { silent = true, buffer = true }
                    
                    map('n', '<leader>ct', crates.toggle, opts)
                    map('n', '<leader>cr', crates.reload, opts)
                    map('n', '<leader>cv', crates.show_features_popup, opts)
                    map('n', '<leader>cu', crates.update_crate, opts)
                    map('n', '<leader>ca', crates.upgrade_all_crates, opts)
                    map('n', 'K', crates.show_popup, opts)
                end,
            })
        end,
    },

    -- Auto pairs (modern replacement for jiangmiao/auto-pairs)
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        dependencies = { 'hrsh7th/nvim-cmp' },
        config = function()
            local npairs = require('nvim-autopairs')
            npairs.setup({
                check_ts = true,  -- Use treesitter
                ts_config = {
                    lua = { 'string' },
                    javascript = { 'template_string' },
                },
            })
            
            -- Integration with nvim-cmp (safe check)
            local cmp_status_ok, cmp = pcall(require, 'cmp')
            if cmp_status_ok then
                local cmp_autopairs = require('nvim-autopairs.completion.cmp')
                cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
            end
        end,
    },

    -- Comment plugin (modern replacement for nerdcommenter)
    {
        'numToStr/Comment.nvim',
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require('Comment').setup({
                -- Add spaces after comment delimiters
                padding = true,
                -- LHS of toggle mappings in NORMAL mode
                toggler = {
                    line = '<leader>cc',  -- Line-comment toggle
                    block = '<leader>bc', -- Block-comment toggle
                },
                -- LHS of operator-pending mappings in NORMAL and VISUAL mode
                opleader = {
                    line = '<leader>c',
                    block = '<leader>b',
                },
            })
        end,
    },

    -- Emmet for HTML/CSS
    {
        'mattn/emmet-vim',
        ft = { 'html', 'css', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
    },

    -- Close tag for HTML/XML
    {
        'alvan/vim-closetag',
        ft = { 'html', 'xml', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
    },
}
