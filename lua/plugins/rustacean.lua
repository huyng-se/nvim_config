return {
  -- Rustaceanvim - Advanced Rust development support
  {
    'mrcjkb/rustaceanvim',
    version = '^5',
    lazy = false,
    ft = { 'rust' },
    config = function()
      vim.g.rustaceanvim = {
        server = {
          on_attach = function(client, bufnr)
            local map = vim.keymap.set
            local opts = { buffer = bufnr, silent = true }
            
            -- Enable inlay hints automatically for Rust files
            if client.server_capabilities.inlayHintProvider then
              vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
            end
            
            -- Keymaps for Rust development
            map("n", "K", function() 
              vim.cmd.RustLsp { 'hover', 'actions' } 
            end, vim.tbl_extend('force', opts, { desc = 'Rust: Hover actions' }))
            
            map("n", "<leader>a", function() 
              vim.cmd.RustLsp('codeAction') 
            end, vim.tbl_extend('force', opts, { desc = 'Rust: Code action' }))
            
            map("n", "gd", function() 
              vim.lsp.buf.definition() 
            end, vim.tbl_extend('force', opts, { desc = 'Rust: Go to definition' }))
            
            map("n", "<leader>rn", function() 
              vim.lsp.buf.rename() 
            end, vim.tbl_extend('force', opts, { desc = 'Rust: Rename' }))
            
            map("n", "<leader>f", function() 
              vim.lsp.buf.format() 
            end, vim.tbl_extend('force', opts, { desc = 'Rust: Format' }))
            
            -- Toggle inlay hints
            map("n", "<leader>ih", function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
            end, vim.tbl_extend('force', opts, { desc = 'Rust: Toggle inlay hints' }))
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
                chainingHints = { enable = true },
                closingBraceHints = { enable = true, minLines = 10 },
                closureReturnTypeHints = { enable = "always" },
                lifetimeElisionHints = { enable = "always", useParameterNames = true },
                maxLength = 25,
                parameterHints = { enable = true },
                reborrowHints = { enable = "always" },
                renderColons = true,
                typeHints = { enable = true, hideClosureInitialization = false, hideNamedConstructor = false },
              },
            },
          },
        },
      }
      
      -- Create user command for toggling inlay hints
      vim.api.nvim_create_user_command('RustInlayHintsToggle', function()
        local bufnr = vim.api.nvim_get_current_buf()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
        local status = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }) and "enabled" or "disabled"
        print("Rust inlay hints " .. status)
      end, { desc = 'Toggle Rust inlay hints' })
    end,
  },
  
  -- Rust.vim - Additional Rust utilities
  {
    'rust-lang/rust.vim',
    ft = 'rust',
    config = function()
      -- Auto format on save with rustfmt
      vim.g.rustfmt_autosave = 1
      
      -- Fold doc comments
      vim.g.rust_fold_doc_comments = 1
      
      vim.g.rustfmt_command = "rustfmt"
      
      -- Show format errors in QuickFix
      vim.g.rustfmt_fail_silently = 0
    end,
  },
  
  -- Crates.nvim - Cargo.toml dependency management
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
          local map = vim.keymap.set
          local opts = { silent = true, buffer = true }
          
          map('n', '<leader>ct', require('crates').toggle, 
            vim.tbl_extend('force', opts, { desc = 'Crates: Toggle' }))
          map('n', '<leader>cr', require('crates').reload, 
            vim.tbl_extend('force', opts, { desc = 'Crates: Reload' }))
          map('n', '<leader>cv', require('crates').show_features_popup, 
            vim.tbl_extend('force', opts, { desc = 'Crates: Show features' }))
          map('n', '<leader>cu', require('crates').update_crate, 
            vim.tbl_extend('force', opts, { desc = 'Crates: Update crate' }))
          map('v', '<leader>cu', require('crates').update_crates, 
            vim.tbl_extend('force', opts, { desc = 'Crates: Update crates' }))
          map('n', '<leader>cU', require('crates').upgrade_crate, 
            vim.tbl_extend('force', opts, { desc = 'Crates: Upgrade crate' }))
          map('v', '<leader>cU', require('crates').upgrade_crates, 
            vim.tbl_extend('force', opts, { desc = 'Crates: Upgrade crates' }))
        end,
      })
    end,
  },
}
