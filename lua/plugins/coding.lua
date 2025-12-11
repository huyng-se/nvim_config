-- Coding plugins: LSP, completion, snippets
-- Replacing COC.nvim with native LSP
-- Using vim.lsp.config API (Neovim 0.11+) instead of deprecated lspconfig.setup()

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
                
                -- Show diagnostic in insert mode
                map('i', '<C-s>', function()
                    vim.diagnostic.open_float(nil, { focus = false, scope = 'cursor' })
                end, vim.tbl_extend('force', opts, { desc = 'Show diagnostic' }))
            end
            
            -- Define LSP server configurations using vim.lsp.config (Neovim 0.11+)
            -- C/C++ (clangd replaces ccls)
            vim.lsp.config.clangd = {
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--header-insertion=iwyu",
                    "--completion-style=detailed",
                    "--function-arg-placeholders",
                },
                filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
                root_markers = { '.clangd', '.clang-tidy', '.clang-format', 'compile_commands.json', 'compile_flags.txt', 'configure.ac', '.git' },
                capabilities = capabilities,
            }
            
            -- CMake
            vim.lsp.config.cmake = {
                cmd = { 'cmake-language-server' },
                filetypes = { 'cmake' },
                root_markers = { 'CMakePresets.json', 'CTestConfig.cmake', '.git', 'build', 'cmake' },
                capabilities = capabilities,
            }
            
            -- Python (pyright)
            vim.lsp.config.pyright = {
                cmd = { 'pyright-langserver', '--stdio' },
                filetypes = { 'python' },
                root_markers = { 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', 'Pipfile', 'pyrightconfig.json', '.git' },
                capabilities = capabilities,
            }
            
            -- Lua (for Neovim configuration)
            vim.lsp.config.lua_ls = {
                cmd = { 'lua-language-server' },
                filetypes = { 'lua' },
                root_markers = { '.luarc.json', '.luarc.jsonc', '.luacheckrc', '.stylua.toml', 'stylua.toml', 'selene.toml', 'selene.yml', '.git' },
                capabilities = capabilities,
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
            }
            
            -- Mason-lspconfig setup with automatic handlers
            require('mason-lspconfig').setup({
                -- Automatically install these language servers
                ensure_installed = {
                    'lua_ls',      -- Lua
                    'clangd',      -- C/C++
                    'cmake',       -- CMake
                    'pyright',     -- Python
                },
                automatic_installation = true,
                -- Automatic handlers using vim.lsp.enable
                handlers = {
                    -- Default handler for all servers
                    function(server_name)
                        vim.lsp.enable(server_name)
                    end,
                    -- Custom handlers can be added here if needed
                    -- For example:
                    -- ['lua_ls'] = function()
                    --     vim.lsp.enable('lua_ls')
                    -- end,
                },
            })
            
            -- Set up on_attach for all LSP clients
            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if client then
                        on_attach(client, args.buf)
                    end
                end,
            })
            
            -- Diagnostic configuration
            vim.diagnostic.config({
                virtual_text = true,
                signs = true,
                update_in_insert = true,
                underline = true,
                severity_sort = true,
                float = {
                    border = 'rounded',
                    source = 'always',
                    header = '',
                    prefix = '',
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

    -- LSP Configuration (keep plugin loaded for backward compatibility and utility functions)
    -- Note: We use vim.lsp.config API directly instead of lspconfig.setup()
    {
        'neovim/nvim-lspconfig',
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'williamboman/mason-lspconfig.nvim',
        },
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
                    { name = 'copilot' },  -- GitHub Copilot suggestions (after LSP)
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
                            copilot = "[Copilot]",
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

    -- GitHub Copilot - AI-powered code completion
    -- Note: Requires GitHub Copilot subscription and authentication with :Copilot auth
    {
        'zbirenbaum/copilot.lua',
        cmd = 'Copilot',
        event = 'InsertEnter',
        config = function()
            require('copilot').setup({
                panel = {
                    enabled = true,
                    auto_refresh = false,
                    keymap = {
                        jump_prev = '[[',
                        jump_next = ']]',
                        accept = '<CR>',
                        refresh = 'gr',
                        open = '<M-p>'  -- Alt+P to open panel (P for Panel)
                    },
                    layout = {
                        position = 'bottom', -- 'top', 'left', 'right', 'bottom'
                        ratio = 0.4
                    },
                },
                suggestion = {
                    enabled = true,
                    auto_trigger = true,  -- Auto-trigger suggestions
                    debounce = 75,
                    keymap = {
                        accept = '<M-l>',      -- Alt+l to accept suggestion
                        accept_word = false,
                        accept_line = false,
                        next = '<M-]>',        -- Alt+] for next suggestion
                        prev = '<M-[>',        -- Alt+[ for previous suggestion
                        dismiss = '<C-]>',     -- Ctrl+] to dismiss suggestion
                    },
                },
                filetypes = {
                    yaml = false,
                    markdown = false,
                    help = false,
                    gitcommit = false,
                    gitrebase = false,
                    hgcommit = false,
                    svn = false,
                    cvs = false,
                    ['.'] = false,
                },
                copilot_node_command = 'node', -- Node.js version must be > 18.x
                server_opts_overrides = {},
            })
        end,
    },

    -- Copilot completion source for nvim-cmp
    {
        'zbirenbaum/copilot-cmp',
        dependencies = { 'zbirenbaum/copilot.lua' },
        config = function()
            require('copilot_cmp').setup()
        end,
    },
}
