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

### nvim-cmp Integration (Primary Method)

**Copilot suggestions hiện trong nvim-cmp completion menu** (không còn inline ghost text).

| Phím | Chế độ | Mô tả |
|------|--------|-------|
| `Tab` | Insert | Navigate đến item tiếp theo trong nvim-cmp menu |
| `Shift+Tab` | Insert | Navigate đến item trước |
| `Enter` | Insert | **Accept** selected completion (bao gồm Copilot) |
| `Ctrl+Space` | Insert | Trigger completion menu thủ công |
| `Ctrl+E` | Insert | Dismiss completion menu |

**Priority:** Copilot suggestions có priority cao nhất (1000) trong nvim-cmp sources, vì vậy thường xuất hiện đầu tiên.

**Lưu ý:**
- Inline suggestions (`Alt+L`, `Alt+]`, `Alt+[`) đã **disabled**
- Tất cả Copilot suggestions hiện qua nvim-cmp menu
- Suggestions tự động trigger khi gõ
- Icon `` hiện trong cmp menu cho Copilot suggestions

### Copilot Panel (Alternative Method)

Nhấn `Alt+P` để mở panel với nhiều suggestions (dùng khi muốn xem nhiều options).

| Phím | Chế độ | Mô tả |
|------|--------|-------|
| `Alt+P` | Insert/Normal | Mở Copilot panel (multiple suggestions) |
| `]]` | Panel | Jump đến suggestion tiếp theo |
| `[[` | Panel | Jump đến suggestion trước |
| `Enter` | Panel | Accept suggestion đang chọn |
| `gr` | Panel | Refresh suggestions (tạo suggestions mới) |
| `q` hoặc `Esc` | Panel | Đóng panel |

**Panel Layout:**
- Panel mở ở bottom (40% màn hình)
- Hiện 10 suggestions khác nhau
- Navigate với `]]` và `[[`
- Accept với `Enter`

---

## 💡 Cách sử dụng hiệu quả

### 1. Code Completion Cơ Bản

**Scenario:** Bạn muốn viết một function.

```python
# Bước 1: Viết function signature
def calculate_fibonacci(n):

# Bước 2: Copilot suggestion xuất hiện trong nvim-cmp menu
# Bước 3: Tab để navigate, Enter để accept
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

// Start typing và nhấn Ctrl+Space (nếu menu chưa hiện)
// Copilot suggests trong nvim-cmp menu:
function validateEmail(email) {
    const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return re.test(email);
}
```

### 2. Multiple Suggestions (Copilot Panel)

**Scenario:** Bạn muốn xem nhiều cách implement khác nhau.

```rust
// Bước 1: Viết comment
// Sort vector of integers in descending order

// Bước 2: Alt+P để mở Copilot panel
// Bước 3: Xem 10 suggestions khác nhau:
// - Option 1: Using sort_by
// - Option 2: Using sort_unstable_by
// - Option 3: Using reverse after sort
// etc.

// Bước 4: ]] để navigate, Enter để accept
```

**Tips:** Sử dụng panel khi:
- Muốn so sánh nhiều approaches
- Suggestion trong cmp menu không ưng ý
- Học cách implement mới
- Cần xem alternative implementations

### 3. Comment-Driven Development

**Technique:** Viết comment mô tả logic, Copilot generate code.

**Example 1: Algorithm**
```python
# Function to find the longest common subsequence of two strings
# using dynamic programming approach
def lcs(s1, s2):
    # Copilot suggests complete DP implementation
```

**Example 2: API Call**
```javascript
// Fetch user data from API and handle errors
// Use async/await with try-catch
async function getUserData(userId) {
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

### 8. Working with nvim-cmp Integration

**Config này integrate Copilot trực tiếp vào nvim-cmp completion menu.**

**Features:**
- Copilot suggestions hiện trong cmp menu với icon ``
- Priority: 1000 (cao nhất, nên suggestions xuất hiện đầu tiên)
- Inline suggestions (ghost text) đã disabled
- Panel vẫn available qua `Alt+P`

**Example flow:**
```
1. Bắt đầu gõ: "func"
2. Completion menu tự động xuất hiện với:
    [Copilot] function getUserById() { ... }  (priority 1000)
    [LSP] function (from language server)     (priority 900)
    [LuaSnip] function template               (priority 750)
    [Buffer] function (từ file khác)
3. Tab/Shift+Tab để navigate
4. Enter để accept Copilot suggestion
```

**Configuration:**
```lua
-- lua/plugins/coding.lua
{
    'zbirenbaum/copilot.lua',
    config = function()
        require('copilot').setup({
            suggestion = { enabled = false },  -- Disable inline suggestions
            panel = { enabled = false },       -- Panel chỉ mở qua Alt+P
        })
    end,
}

-- nvim-cmp sources với priority
sources = {
    { name = 'copilot',  priority = 1000 },  -- Cao nhất
    { name = 'nvim_lsp', priority = 900 },
    { name = 'luasnip',  priority = 750 },
    { name = 'buffer' },
    { name = 'path' },
}
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

✅ **Use Copilot panel** (`Alt+P`) để xem alternatives
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
:Copilot panel        " Mở Copilot panel (hoặc Alt+P)
```

### Diagnostics

```vim
:Copilot feedback     " Gửi feedback về Copilot
```

---

## ⚙️ Cấu hình chi tiết

### Config trong lua/plugins/coding.lua

```lua
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
                    open = '<M-p>'  -- Alt+P (P for Panel)
                },
                layout = {
                    position = 'bottom', -- 'top' | 'left' | 'right' | 'bottom'
                    ratio = 0.4          -- 40% screen height
                },
            },
            suggestion = {
                enabled = true,
                auto_trigger = true,  -- Auto show suggestions
                debounce = 75,        -- Delay before showing (ms)
                keymap = {
                    accept = '<M-l>',      -- Alt+l
                    accept_word = false,   -- Disabled
                    accept_line = false,   -- Disabled
                    next = '<M-]>',        -- Alt+]
                    prev = '<M-[>',        -- Alt+[
                    dismiss = '<C-]>',     -- Ctrl+]
                },
            },
            filetypes = {
                -- Disable Copilot for these filetypes
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
            copilot_node_command = 'node', -- Node.js >= 18.x required
            server_opts_overrides = {},
        })
    end,
}
```

### nvim-cmp Integration

```lua
{
    'zbirenbaum/copilot-cmp',
    dependencies = { 'zbirenbaum/copilot.lua' },
    config = function()
        require('copilot_cmp').setup()
    end,
}

-- In nvim-cmp setup:
sources = cmp.config.sources({
    { name = 'nvim_lsp' },     -- LSP first
    { name = 'copilot' },      -- Copilot second
    { name = 'luasnip' },
    { name = 'crates' },
}, {
    { name = 'buffer' },
    { name = 'path' },
}),
```

### Customization Options

**Thay đổi keymaps:**

```lua
-- Trong suggestion keymap
keymap = {
    accept = '<C-y>',      -- Thay Alt+l bằng Ctrl+y
    next = '<C-n>',        -- Thay Alt+] bằng Ctrl+n
    prev = '<C-p>',        -- Thay Alt+[ bằng Ctrl+p
    dismiss = '<C-e>',     -- Thay Ctrl+] bằng Ctrl+e
}
```

**Thay đổi panel position:**

```lua
layout = {
    position = 'right',    -- Panel ở bên phải
    ratio = 0.3            -- 30% screen width
}
```

**Disable auto trigger:**

```lua
suggestion = {
    auto_trigger = false,  -- Không tự động show
    -- Trigger manually với Ctrl+Space
}
```

**Enable cho markdown:**

```lua
filetypes = {
    markdown = true,  -- Enable Copilot cho markdown
    -- ...
}
```

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
" Find copilot.lua và copilot-cmp
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

**Lỗi:** Alt+P không mở panel

**Solutions:**
```vim
" 1. Check keymap conflict
:verbose map <M-p>

" 2. Try command directly
:Copilot panel

" 3. Check terminal Alt key support
" Một số terminals không support Alt key properly
" Thử remap:
```

```lua
keymap = {
    open = '<C-p>'  -- Thay Alt+P bằng Ctrl+P nếu cần
}
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

**Lỗi:** Copilot và cmp không work together

**Solutions:**
```vim
" 1. Check copilot-cmp installed
:Lazy

" 2. Check sources order
:lua print(vim.inspect(require('cmp').get_config().sources))

" 3. Reinstall
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

**Update:** December 2024
