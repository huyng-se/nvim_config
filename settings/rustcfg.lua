-- Tự động format code khi lưu file (dùng rustfmt)
vim.g.rustfmt_autosave = 1

-- Bật tính năng gấp code (folding) cho Rust (ẩn các hàm/khối code)
-- vim.g.rust_fold = 1

-- Ẩn các cấu hình test/doc ẩn (giúp nhìn code gọn hơn)
vim.g.rust_fold_doc_comments = 1 

vim.g.rustfmt_command = "rustfmt"

-- Hiển thị thông báo lỗi format trong danh sách QuickFix (nếu có lỗi cú pháp)
vim.g.rustfmt_fail_silently = 0 
