vim.g.rustaceanvim = {
  server = {
    on_attach = function(client, bufnr)
      -- (Giữ nguyên các keymap của bạn ở đây)
      local map = vim.keymap.set
      local opts = { buffer = bufnr, silent = true }
      map("n", "K", function() vim.cmd.RustLsp { 'hover', 'actions' } end, opts)
      map("n", "<leader>a", function() vim.cmd.RustLsp('codeAction') end, opts)
      map("n", "gd", function() vim.lsp.buf.definition() end, opts)
      map("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
      map("n", "<leader>f", function() vim.lsp.buf.format() end, opts)
    end,
    
    default_settings = {
      -- config của rust-analyzer
      ['rust-analyzer'] = {
        -- QUAN TRỌNG: Dùng 'check' thay vì 'checkOnSave'
        check = {
            command = "clippy",
            features = "all",
        },
        -- Đảm bảo không còn dòng 'checkOnSave' nào ở đây nữa
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
