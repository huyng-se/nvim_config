# 🤖 GitHub Copilot - AI Pair Programming

Hướng dẫn chi tiết về GitHub Copilot integration trong Neovim.

GitHub Copilot là AI assistant giúp viết code nhanh hơn với suggestions thông minh dựa trên context.

## 📑 Mục lục

- [Requirements](#-requirements)
- [Kích hoạt Copilot](#-kích-hoạt-copilot)
- [Phím tắt](#️-phím-tắt)
- [Cách sử dụng hiệu quả](#-cách-sử-dụng-hiệu-quả)
- [Best Practices](#-best-practices)
- [Tất cả lệnh Copilot](#-tất-cả-lệnh-copilot)
- [Cấu hình chi tiết](#️-cấu-hình-chi-tiết)
- [Troubleshooting](#-troubleshooting)
- [Resources](#-resources)

---

## 📋 Requirements

### 1. GitHub Copilot Subscription

Copilot yêu cầu subscription (trả phí hoặc miễn phí cho students/maintainers):

- **GitHub Copilot Individual**: $10/tháng hoặc $100/năm
- **GitHub Copilot Business**: $19/user/tháng
- **Miễn phí cho:**
  - Verified students (GitHub Student Developer Pack)
  - Maintainers của popular open-source projects
  - GitHub Sponsors users

**Đăng ký:** [https://github.com/features/copilot](https://github.com/features/copilot)

**Check eligibility:** [https://education.github.com/](https://education.github.com/) (cho students)

### 2. Node.js >= 18.x

Copilot plugin yêu cầu Node.js version 18 trở lên:

```bash
# Check Node.js version
node --version

# Should be >= v18.0.0
```

**Cài Node.js nếu chưa có:**

```bash
# macOS
brew install node

# Ubuntu/Debian
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs

# Arch Linux
sudo pacman -S nodejs npm

# Windows
# Download từ https://nodejs.org/
```

### 3. Neovim >= 0.11.0

Cấu hình này yêu cầu Neovim version 0.11.0 trở lên.

```bash
nvim --version
```

### 4. Plugin đã cài

Plugin được cài tự động qua Lazy.nvim khi khởi động Neovim lần đầu:

- `zbirenbaum/copilot.lua` - Main Copilot plugin
- `zbirenbaum/copilot-cmp` - Integration với nvim-cmp

---

## 🚀 Kích hoạt Copilot

### First-Time Setup

Sau khi cài Neovim config, làm theo các bước:

#### 1. Khởi động Neovim

```bash
nvim
```

#### 2. Authenticate với GitHub

Chạy lệnh trong Neovim:

```vim
:Copilot auth
```

**Quá trình authentication:**

1. Một URL sẽ hiện ra (ví dụ: `https://github.com/login/device`)
2. Một device code sẽ hiện ra (ví dụ: `1234-5678`)
3. Mở URL trong browser
4. Paste device code
5. Authorize GitHub Copilot
6. Quay lại Neovim - authentication hoàn tất!

#### 3. Verify Copilot đã hoạt động

```vim
:Copilot status
```

Nên thấy:

```
Copilot: Ready
```

### Bật/Tắt Copilot

```vim
:Copilot enable   " Bật Copilot
:Copilot disable  " Tắt Copilot
:Copilot status   " Kiểm tra trạng thái
```

---

## ⌨️ Phím tắt

### Copilot Inline Suggestions (Chính)

**Config hiện tại:** Copilot hoạt động với **inline suggestions** (ghost text) - gợi ý xuất hiện ngay tại vị trí con trỏ dưới dạng text mờ.

**Keymaps cho Inline Suggestions:**

| Phím | Chế độ | Mô tả |
|------|--------|-------|
| `Alt+L` | Insert | **Chấp nhận** suggestion hiện tại (accept toàn bộ) |
| `Alt+]` | Insert | Xem suggestion **tiếp theo** |
| `Alt+[` | Insert | Xem suggestion **trước đó** |
| `Ctrl+]` | Insert | **Dismiss** (bỏ qua) suggestion hiện tại |

**Cách hoạt động:**

1. Khi bạn gõ code, Copilot tự động hiển thị suggestion dưới dạng **ghost text** (text màu xám)
2. Ghost text xuất hiện sau 75ms (debounce time)
3. Nhấn `Alt+L` để chấp nhận toàn bộ suggestion
4. Nhấn `Alt+]` để xem các suggestions thay thế khác
5. Nhấn `Ctrl+]` hoặc tiếp tục gõ để bỏ qua

**Visual Example:**

```python
def fibonacci(n):
    # Bạn gõ: "if"
    # Copilot hiện ghost text: if n <= 1:
                                   return n
    # Nhấn Alt+L để accept hoặc Alt+] để xem suggestion khác
```

### Copilot Commands

**Authentication & Status:**

| Lệnh | Mô tả |
|------|-------|
| `:Copilot auth` | Xác thực với GitHub (lần đầu) |
| `:Copilot status` | Kiểm tra trạng thái Copilot |
| `:Copilot version` | Xem version |

**Enable/Disable:**

| Lệnh | Mô tả |
|------|-------|
| `:Copilot enable` | Bật Copilot |
| `:Copilot disable` | Tắt Copilot tạm thời |

### Lưu ý quan trọng

⚠️ **Panel mode** đã được tắt trong config hiện tại. Sử dụng `Alt+]` để xem nhiều suggestions thay thế.

💡 **Tips cho inline suggestions:**

- Copilot suggestions tự động trigger khi bạn dừng gõ (75ms debounce)
- Ghost text không can thiệp vào typing workflow - bạn có thể ignore bằng cách tiếp tục gõ
- Nhấn `Alt+L` để accept nhanh toàn bộ suggestion
- Nhấn `Alt+]` để xem alternatives khi suggestion hiện tại không phù hợp
- Nhấn `Ctrl+]` để dismiss suggestion hiện tại
- Suggestions thông minh hơn khi có comments mô tả rõ ràng trước code

---

## 💡 Cách sử dụng hiệu quả

### 1. Code Completion Cơ Bản

**Scenario:** Bạn muốn viết một function.

```python
# Bước 1: Viết function signature hoặc comment
def calculate_fibonacci(n):

# Bước 2: Chờ ghost text xuất hiện (75ms debounce)
# Copilot tự động suggest implementation

# Bước 3: Nhấn Alt+L để accept toàn bộ suggestion
# Hoặc Alt+] để xem suggestions thay thế
# Hoặc tiếp tục gõ để ignore
```

**Kết quả:**

```python
def calculate_fibonacci(n):
    if n <= 1:
        return n
    return calculate_fibonacci(n-1) + calculate_fibonacci(n-2)
```

**Real example:**

```javascript
// Viết comment mô tả
// Function to validate email address

// Copilot suggests ghost text:
function validateEmail(email) {
    const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return re.test(email);
}
// Nhấn Alt+L để accept
```

### 2. Comment-Driven Development

**Technique:** Viết comment mô tả logic, Copilot generate code trong completion menu.

**Example 1: Algorithm**

```python
# Function to find the longest common subsequence of two strings
# using dynamic programming approach
def lcs(s1, s2):
    # Trigger completion (Ctrl+Space)
    # Copilot suggests complete DP implementation
```

**Example 2: API Call**

```javascript
// Fetch user data from API and handle errors
// Use async/await with try-catch
async function getUserData(userId) {
    // Trigger completion
    // Copilot suggests:
    try {
        const response = await fetch(`/api/users/${userId}`);
        if (!response.ok) {
            throw new Error('User not found');
        }
        return await response.json();
    } catch (error) {
        console.error('Error fetching user:', error);
        return null;
    }
}
```

**Example 3: Complex Logic**

```rust
// Parse command line arguments
// Support flags: --verbose, --output <file>, --input <file>
// Return Result with parsed config or error
fn parse_args() -> Result<Config, String> {
    // Copilot suggests complete argument parser
}
```

### 4. Test Generation

**Scenario:** Tạo unit tests cho function.

```python
def add(a, b):
    return a + b

# Write comment for test
# Unit tests for add function covering edge cases
def test_add():
    # Copilot suggests multiple test cases:
    assert add(1, 2) == 3
    assert add(-1, 1) == 0
    assert add(0, 0) == 0
    assert add(-5, -3) == -8
```

**Example với Rust:**

```rust
fn divide(a: f64, b: f64) -> Result<f64, String> {
    if b == 0.0 {
        Err("Division by zero".to_string())
    } else {
        Ok(a / b)
    }
}

// Tests for divide function
#[cfg(test)]
mod tests {
    use super::*;
    
    // Copilot suggests test cases
    #[test]
    fn test_divide_normal() {
        assert_eq!(divide(10.0, 2.0).unwrap(), 5.0);
    }
    
    #[test]
    fn test_divide_by_zero() {
        assert!(divide(10.0, 0.0).is_err());
    }
}
```

### 5. Code Documentation

**Scenario:** Generate docstrings/comments.

**Python docstring:**

```python
def binary_search(arr, target):
    """
    # Type: """
    # Copilot suggests complete docstring:
    """
    Perform binary search on a sorted array.
    
    Args:
        arr: Sorted list of integers
        target: Integer to search for
        
    Returns:
        Index of target if found, -1 otherwise
        
    Time Complexity: O(log n)
    Space Complexity: O(1)
    """
```

**Rust documentation:**

```rust
/// # Type: ///
// Copilot suggests:
/// Calculates the factorial of a number.
///
/// # Arguments
/// * `n` - The number to calculate factorial for
///
/// # Returns
/// The factorial of n
///
/// # Examples
/// ```
/// assert_eq!(factorial(5), 120);
/// ```
fn factorial(n: u64) -> u64 {
    // ...
}
```

### 6. Code Translation/Conversion

**Scenario:** Convert code từ ngôn ngữ này sang ngôn ngữ khác.

**JavaScript to Python:**

```python
# Convert this JavaScript function to Python:
# function greet(name) {
#     return `Hello, ${name}!`;
# }

# Python equivalent:
def greet(name):
    # Copilot suggests:
    return f"Hello, {name}!"
```

**Python to Rust:**

```rust
// Convert this Python code to Rust:
// def is_prime(n):
//     if n < 2:
//         return False
//     for i in range(2, int(n**0.5) + 1):
//         if n % i == 0:
//             return False
//     return True

// Rust equivalent:
fn is_prime(n: u64) -> bool {
    // Copilot suggests Rust implementation
}
```

### 7. Boilerplate Generation

**Scenario:** Generate repetitive code nhanh.

**Example: HTTP handlers**

```rust
// CRUD handlers for User model
async fn create_user(user: Json<User>) -> Result<Json<User>, Error> {
    // Copilot suggests complete handler
}

async fn get_user(id: Path<i32>) -> Result<Json<User>, Error> {
    // Copilot suggests
}

async fn update_user(id: Path<i32>, user: Json<User>) -> Result<Json<User>, Error> {
    // Copilot suggests
}

async fn delete_user(id: Path<i32>) -> Result<StatusCode, Error> {
    // Copilot suggests
}
```

### 8. Inline Suggestions Workflow

Copilot hoạt động với **inline suggestions** (ghost text) thay vì tích hợp vào nvim-cmp completion menu.

**Features:**

- Suggestions xuất hiện tự động dưới dạng **ghost text** (text màu xám)
- Không can thiệp vào nvim-cmp completion menu
- Keymaps riêng: `Alt+L` để accept, `Alt+]` để xem alternatives
- Debounce time 75ms để tránh spam suggestions

**Example flow:**

```
1. Bắt đầu gõ: "def fib"
2. Copilot hiển thị ghost text: def fibonacci(n):
                                 if n <= 1:
                                     return n
                                 return fibonacci(n-1) + fibonacci(n-2)
3. Nhấn Alt+L để accept toàn bộ
4. Hoặc Alt+] để xem suggestion khác
5. Hoặc tiếp tục gõ để ignore
```

---

## ✅ Best Practices

### DO (Nên làm)

✅ **Viết descriptive comments** trước khi code

- Giúp Copilot hiểu intent
- Generate code chính xác hơn

✅ **Review code suggestions** trước khi accept

- Copilot có thể sai
- Đảm bảo code đúng logic

✅ **Sử dụng consistent naming conventions**

- Copilot học từ codebase
- Giúp suggestions consistent

✅ **Break down complex tasks** thành smaller functions

- Comment mỗi function rõ ràng
- Copilot generate từng phần tốt hơn

✅ **Use alternative suggestions** (`Alt+]`/`Alt+[`) để xem alternatives

- Compare different approaches
- Học code patterns mới

✅ **Accept partially** và chỉnh sửa

- Không cần accept toàn bộ
- Accept rồi modify cho đúng

✅ **Combine với LSP**

- Copilot + LSP = powerful combo
- LSP check errors, Copilot suggest fixes

### DON'T (Không nên)

❌ **Blindly accept mọi suggestions**

- Always review code
- Check logic, security, performance

❌ **Rely 100% vào Copilot**

- Copilot là assistant, không phải replacement
- Vẫn cần hiểu code

❌ **Accept code bạn không hiểu**

- Nếu không hiểu, đừng dùng
- Hoặc research trước khi accept

❌ **Use cho sensitive code** (passwords, keys, tokens)

- Never paste secrets vào code
- Copilot có thể learn và suggest secrets

❌ **Expect perfect code** mọi lúc

- Copilot không phải perfect
- Sometimes suggests wrong patterns

❌ **Ignore security concerns**

- Review security implications
- Don't trust suggestions với auth/crypto code

❌ **Copy code không test**

- Always test generated code
- Especially edge cases

---

## 📜 Tất cả lệnh Copilot

### Authentication & Status

```vim
:Copilot auth         " Authenticate với GitHub (first time)
:Copilot status       " Check Copilot status
:Copilot version      " Xem Copilot version
```

### Enable/Disable

```vim
:Copilot enable       " Bật Copilot
:Copilot disable      " Tắt Copilot tạm thời
:Copilot detach       " Detach Copilot client
```

### Panel

```vim
:Copilot panel        " Mở Copilot panel (hiện tại bị tắt trong config)
```

### Diagnostics

```vim
:Copilot feedback     " Gửi feedback về Copilot
```

---

## ⚙️ Cấu hình chi tiết

### Config trong lua/plugins/coding.lua

**Copilot Plugin:**

```lua
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
}
```

### nvim-cmp Integration

**Config hiện tại:** Copilot hoạt động độc lập với inline suggestions, không tích hợp vào nvim-cmp completion menu.

**Trong nvim-cmp setup:**

```lua
{
    'hrsh7th/nvim-cmp',
    dependencies = {
        -- ...other dependencies
        -- Không có copilot-cmp trong config hiện tại
    },
    config = function()
        local cmp = require('cmp')
        
        cmp.setup({
            sources = cmp.config.sources({
                { name = 'nvim_lsp', priority = 1000 },  -- LSP đầu tiên
                { name = 'luasnip', priority = 750 },   -- Snippets thứ hai
                { name = 'path' },
            }, {
                { name = 'buffer' },
            }),
            -- ...other config
        })
    end,
}
```

### Tại sao config này?

**Lý do dùng inline suggestions:**

1. **UX đơn giản hơn:** Ghost text trực quan và không can thiệp vào completion menu
2. **Không conflict:** Tránh conflict giữa inline suggestions và nvim-cmp menu
3. **Performance tốt hơn:** Ít resource hơn khi không tích hợp vào completion engine
4. **Workflow tự nhiên:** Gõ code như bình thường, suggestions xuất hiện khi cần

**Nếu muốn tích hợp vào nvim-cmp:** Có thể thêm `copilot-cmp` plugin và cấu hình sources tương ứng.

### Customization Options

**Thay đổi priority:**

```lua
sources = cmp.config.sources({
    { name = 'nvim_lsp', priority = 1000 },  -- LSP đầu tiên
    { name = 'copilot', priority = 900 },    -- Copilot thứ hai
    -- ...
})
```

**Tắt Copilot cho một số filetypes:**

```lua
-- Trong copilot.lua setup
filetypes = {
    yaml = false,
    markdown = false,
    help = false,
    gitcommit = false,
    ["."] = false,
}
```

**Inline suggestions hiện tại đã enabled (khuyến nghị):**

```lua
require('copilot').setup({
    suggestion = { 
        enabled = true,  -- Đã bật
        auto_trigger = true,
        debounce = 75,
        keymap = {
            accept = '<M-l>',    -- Alt+L
            next = '<M-]>',      -- Alt+]
            prev = '<M-[>',      -- Alt+[
            dismiss = '<C-]>',   -- Ctrl+]
        }
    },
    panel = { enabled = false },
})
```

```

**Enable panel mode (tùy chọn):**

```lua
require('copilot').setup({
    suggestion = { enabled = true },
    panel = { 
        enabled = true,
        auto_refresh = false,
        keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>"
        },
        layout = {
            position = "bottom", -- | top | left | right
            ratio = 0.4
        },
    },
    filetypes = {
        -- ... other filetypes
    },
})
```

**Panel keymaps:**

- `Alt+Enter`: Mở panel
- `Enter`: Accept suggestion trong panel
- `[[` / `]]`: Navigate giữa suggestions
- `gr`: Refresh suggestions

---

## 🔧 Troubleshooting

### Copilot không hoạt động

**Lỗi:** Suggestions không xuất hiện

**Solutions:**

```vim
" 1. Check status
:Copilot status

" 2. Kiểm tra Node.js version
:!node --version
" Phải >= 18.x

" 3. Re-authenticate
:Copilot disable
:Copilot auth

" 4. Restart Neovim
:qa
nvim

" 5. Check plugin installed
:Lazy
" Find copilot.lua
```

### Authentication failed

**Lỗi:** Cannot authenticate với GitHub

**Solutions:**

```bash
# 1. Check internet connection
ping github.com

# 2. Try authenticating again
nvim
:Copilot auth

# 3. Check GitHub Copilot subscription
# Visit: https://github.com/settings/copilot

# 4. Clear Copilot cache
rm -rf ~/.config/github-copilot
nvim
:Copilot auth
```

### Suggestions quá chậm

**Lỗi:** Copilot lâu mới suggest

**Solutions:**

```lua
-- Giảm debounce time trong config
suggestion = {
    debounce = 50,  -- Giảm từ 75 xuống 50ms
}
```

### Panel không mở

**Lỗi:** Panel bị tắt trong config hiện tại

**Solutions:**

```vim
" 1. Enable panel trong config
" Tham khảo phần "Enable panel mode" ở trên

" 2. Hoặc sử dụng inline suggestions với Alt+]
" Alt+] để xem suggestions thay thế
```

**Nếu đã enable panel:**

```vim
" 1. Check keymap conflict
:verbose map <M-p>

" 2. Try command directly
:Copilot panel

" 3. Check terminal Alt key support
" Một số terminals không support Alt key properly
```

### Copilot suggest sai

**Lỗi:** Suggestions không liên quan

**Solutions:**

1. **Viết comment rõ ràng hơn**

   ```python
   # Bad: "function"
   # Good: "Function to validate email using regex pattern"
   ```

2. **Provide more context**
   - Viết type hints
   - Có examples trong file
   - Clear variable names

3. **Try multiple suggestions**
   - `Alt+]` để xem suggestions khác
   - `Alt+P` để mở panel

4. **Break down complex tasks**
   - Nhỏ hơn, specific hơn
   - Từng bước một

### Cannot disable Copilot cho filetype

**Lỗi:** Copilot vẫn suggest trong markdown

**Solutions:**

```lua
-- Trong config
filetypes = {
    markdown = false,     -- Explicit false
    ['*'] = true,         -- Enable cho tất cả khác
}

-- Hoặc disable manually:
:Copilot disable
```

### Conflict với nvim-cmp

**Lỗi:** Copilot và cmp conflict (ít xảy ra với config hiện tại)

**Solutions:**

```vim
" 1. Check sources order
:lua print(vim.inspect(require('cmp').get_config().sources))

" 2. Restart Neovim
:qa
nvim

" 3. Reinstall plugins
:Lazy sync
```

### Node.js version cũ

**Lỗi:** "Copilot requires Node.js >= 18"

**Solutions:**

```bash
# Update Node.js
# macOS
brew upgrade node

# Ubuntu/Debian
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs

# Check version
node --version
```

---

## 📚 Resources

### Official Documentation

- [GitHub Copilot](https://github.com/features/copilot)
- [copilot.lua Plugin](https://github.com/zbirenbaum/copilot.lua)
- [copilot-cmp Plugin](https://github.com/zbirenbaum/copilot-cmp)
- [GitHub Copilot Docs](https://docs.github.com/en/copilot)

### Pricing & Subscription

- [Copilot Pricing](https://github.com/features/copilot#pricing)
- [Student Pack](https://education.github.com/pack) - Free Copilot cho students
- [Copilot for Business](https://github.com/features/copilot/plans)

### Learning Resources

- [Copilot Best Practices](https://github.blog/2023-06-20-how-to-write-better-prompts-for-github-copilot/)
- [Copilot Patterns](https://github.blog/2023-05-17-inside-github-working-with-the-llms-behind-github-copilot/)
- [Prompt Engineering for Copilot](https://www.youtube.com/results?search_query=github+copilot+tips)

### Alternatives

- [Tabnine](https://www.tabnine.com/) - AI completion alternative
- [Codeium](https://codeium.com/) - Free alternative
- [Amazon CodeWhisperer](https://aws.amazon.com/codewhisperer/) - AWS alternative

---

## 📖 Tài liệu khác

- [KEYMAPS.md](KEYMAPS.md) - Tất cả phím tắt Neovim
- [LAZYGIT.md](LAZYGIT.md) - Hướng dẫn LazyGit
- [INSTALLATION.md](INSTALLATION.md) - Hướng dẫn cài đặt
- [PLUGINS.md](PLUGINS.md) - Danh sách plugins
- [README.md](README.md) - Overview

---

**Note:**

- GitHub Copilot yêu cầu subscription (trả phí hoặc miễn phí cho students)
- Suggestions quality phụ thuộc vào context và comments
- Always review code trước khi accept

**Update:** December 2025
