local status_ok, crates = pcall(require, "crates")
if status_ok then
    crates.setup({
        completion = {
            cmp = { enabled = false },
        },
        -- Hiển thị thông tin phiên bản ảo ngay bên cạnh dòng (Inlay Hints)
        text = {
            loading = "  Loading...",
            version = "  %s",
            prerelease = "  %s",
            yanked = "  %s yanked",
            nomatch = "  Not found",
            upgrade = "  -> %s",
            error = "  Error fetching crate",
        },
        -- Màu sắc cho các thông báo
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

    -- Chỉ tạo phím tắt khi mở file Cargo.toml
    vim.api.nvim_create_autocmd("BufRead", {
        group = vim.api.nvim_create_augroup("Crates_Keymaps", { clear = true }),
        pattern = "Cargo.toml",
        callback = function()
            local map = vim.keymap.set
            local opts = { silent = true, buffer = true }

            -- Bấm <leader>ct để bật tắt hiển thị phiên bản
            map('n', '<leader>ct', crates.toggle, opts)
            -- Bấm <leader>cr để reload lại thông tin
            map('n', '<leader>cr', crates.reload, opts)

            -- Bấm <leader>cv để xem các tính năng (features) của thư viện
            map('n', '<leader>cv', crates.show_features_popup, opts)
            
            -- Bấm <leader>cu để cập nhật thư viện đang trỏ chuột (Update)
            map('n', '<leader>cu', crates.update_crate, opts)
            -- Bấm <leader>ca để cập nhật TẤT CẢ thư viện (Upgrade All)
            map('n', '<leader>ca', crates.upgrade_all_crates, opts)
            
            -- Bấm K để xem thông tin chi tiết thư viện (Homepage, Repo...)
            map('n', 'K', crates.show_popup, opts)
        end,
    })
end
