# ⌨️ Phím tắt - Keyboard Shortcuts

Tài liệu đầy đủ về tất cả phím tắt trong cấu hình Neovim này.

**Leader key:** `Space`

## 📑 Mục lục

- [🎯 Chung (General)](#-chung-general)
- [📦 Quản lý Buffer](#-quản-lý-buffer)
- [🪟 Quản lý Window](#-quản-lý-window)
- [📁 File Explorer (NvimTree)](#-file-explorer-nvimtree)
- [🔍 Fuzzy Finder (Telescope)](#-fuzzy-finder-telescope)
- [🔧 LSP - Code Navigation](#-lsp---code-navigation)
- [💡 Completion (nvim-cmp)](#-completion-nvim-cmp)
- [🤖 GitHub Copilot](#-github-copilot)
- [📝 Todo Comments](#-todo-comments)
- [🐙 Git Integration](#-git-integration)
- [💻 Terminal (Floaterm)](#-terminal-floaterm)
- [🐛 Debug (Vimspector)](#-debug-vimspector)
- [🦀 Rust Specific](#-rust-specific)
- [💬 Comments](#-comments)
- [💡 Tips & Tricks](#-tips--tricks)

---

## 🎯 Chung (General)

| Phím | Chế độ | Mô tả |
|------|--------|-------|
| `Space` | Normal/Visual | Leader key |
| `Esc` | Normal | Xóa highlight tìm kiếm |
| `<` | Visual | Indent trái (giữ visual mode) |
| `>` | Visual | Indent phải (giữ visual mode) |
| `//` | Visual | Tìm kiếm text được chọn |
| `Ctrl+R` | Visual | Tìm và thay thế text được chọn |

**Tip:** Sử dụng `<` và `>` trong Visual mode để indent nhiều lần mà không cần chọn lại.

---

## 📦 Quản lý Buffer

| Phím | Chế độ | Mô tả |
|------|--------|-------|
| `Shift+L` | Normal | Buffer tiếp theo |
| `Shift+H` | Normal | Buffer trước |
| `<leader>bd` | Normal | Đóng buffer hiện tại (không đóng window) |
| `<leader>fn` | Normal | Tạo file mới |
| `<leader>bo` | Normal | Đóng các buffer khác |

**Tip:** Sử dụng `Shift+L` và `Shift+H` để di chuyển nhanh giữa các file đang mở.

---

## 🪟 Quản lý Window

### Resize Windows

| Phím | Chế độ | Mô tả |
|------|--------|-------|
| `Alt+Right` | Normal | Mở rộng split dọc (tăng 2 đơn vị) |
| `Alt+Left` | Normal | Thu nhỏ split dọc (giảm 2 đơn vị) |
| `Alt+Down` | Normal | Mở rộng split ngang (tăng 2 đơn vị) |
| `Alt+Up` | Normal | Thu nhỏ split ngang (giảm 2 đơn vị) |

### Window Management

| Phím | Chế độ | Mô tả |
|------|--------|-------|
| `<leader>wn` | Normal | Tạo window mới (chia dọc) |
| `<leader>wm` | Normal | Tạo window mới (chia ngang) |
| `<leader>wo` | Normal | Đóng các window khác |

**Tip:** Resize step được tăng từ 1 lên 2 để resize nhanh hơn.

---

## 📁 File Explorer (NvimTree)

### Mở/Đóng NvimTree

| Phím | Chế độ | Mô tả |
|------|--------|-------|
| `F5` | Normal | Toggle NvimTree |
| `<leader>e` | Normal | Toggle NvimTree |
| `<leader>o` | Normal | Focus NvimTree |

### Trong NvimTree

| Phím | Mô tả |
|------|-------|
| `o` / `Enter` | Open file/folder |
| `<C-v>` | Open file in vertical split |
| `<C-x>` | Open file in horizontal split |
| `<C-t>` | Open file in new tab |
| `a` | Create new file/folder (thêm `/` ở cuối cho folder) |
| `d` | Delete file/folder |
| `r` | Rename file/folder |
| `x` | Cut file/folder |
| `c` | Copy file/folder |
| `p` | Paste file/folder |
| `R` | Refresh tree |
| `H` | Toggle dotfiles (hidden files) |
| `E` | Expand all folders |
| `W` | Collapse all folders |
| `s` | Open with system default application |
| `?` | Show help |

**Git Status Icons:**

- `✓` - Staged
- `✗` - Unstaged/Modified
- `★` - Untracked
- `➜` - Renamed
- `` - Unmerged
- `` - Deleted
- `◌` - Ignored

---

## 🔍 Fuzzy Finder (Telescope)

### Telescope Pickers

| Phím | Chế độ | Mô tả |
|------|--------|-------|
| `F6` | Normal | Find files |
| `<leader>ff` | Normal | Find files |
| `<leader>fg` | Normal | Live grep (tìm trong content) |
| `<leader>fb` | Normal | Find buffers |
| `<leader>fh` | Normal | Help tags |
| `<leader>fo` | Normal | Recent files (oldfiles) |
| `<leader>fk` | Normal | Keymaps |
| `<leader>fc` | Normal | Commands |

### Trong Telescope

| Phím | Mô tả |
|------|-------|
| `Ctrl+J/K` hoặc `↓/↑` | Di chuyển lên/xuống trong results |
| `Ctrl+N/P` | Lịch sử tìm kiếm |
| `Enter` | Mở file trong buffer hiện tại |
| `Ctrl+X` | Mở file trong horizontal split |
| `Ctrl+V` | Mở file trong vertical split |
| `Ctrl+T` | Mở file trong tab mới |
| `Ctrl+U/D` | Scroll preview lên/xuống |
| `Ctrl+Q` | Send to quickfix list |
| `Tab` | Toggle selection |
| `Esc` | Close Telescope |

**Lệnh Telescope:**

- `:Telescope find_files` - Tìm files
- `:Telescope live_grep` - Tìm trong content (dùng ripgrep)
- `:Telescope buffers` - Liệt kê buffers
- `:Telescope help_tags` - Tìm help
- `:Telescope oldfiles` - Recent files
- `:Telescope keymaps` - Tất cả keymaps
- `:Telescope commands` - Tất cả commands

---

## 🔧 LSP - Code Navigation

### Navigation

| Phím | Chế độ | Mô tả |
|------|--------|-------|
| `gd` | Normal | Go to definition (đi tới định nghĩa) |
| `gy` | Normal | Go to type definition |
| `gi` | Normal | Go to implementation |
| `gr` | Normal | Show references (hiện tất cả tham chiếu) |
| `K` | Normal | Hover documentation (xem tài liệu) |

### Code Actions

| Phím | Chế độ | Mô tả |
|------|--------|-------|
| `<leader>rn` | Normal | Rename symbol (đổi tên biến/hàm) |
| `<leader>cf` | Normal | Format code (định dạng code) |
| `<leader>ca` | Normal/Visual | Code action (sửa lỗi, refactor) |

### Diagnostics

| Phím | Chế độ | Mô tả |
|------|--------|-------|
| `[d` | Normal | Previous diagnostic |
| `]d` | Normal | Next diagnostic |

**Lệnh LSP:**

- `:LspInfo` - Xem trạng thái LSP
- `:Mason` - Mở Mason LSP installer UI

**Diagnostic Signs:**

- `✖` - Error
- `⚠` - Warning
- `➤` - Hint
- `ℹ` - Info

---

## 💡 Completion (nvim-cmp)

### Trong Insert Mode

| Phím | Mô tả |
|------|-------|
| `Tab` | Item tiếp theo / Mở rộng snippet |
| `Shift+Tab` | Item trước / Jump ngược trong snippet |
| `Enter` | Xác nhận completion |
| `Ctrl+Space` | Kích hoạt completion thủ công |
| `Ctrl+F` | Cuộn xuống documentation window |
| `Ctrl+B` | Cuộn lên documentation window |
| `Ctrl+E` | Abort completion |

**Completion Sources (Priority Order):**

1. Copilot (1000) - AI suggestions
2. LSP (900) - Language-specific completions
3. LuaSnip (750) - Snippets
4. Buffer - Words from current file
5. Path - File paths

**Lưu ý:** Copilot suggestions xuất hiện tự động trong completion menu với icon ``.

---

## 🤖 GitHub Copilot

> **Yêu cầu:** GitHub Copilot subscription và Node.js >= 18.x
>
> **Kích hoạt lần đầu:** `:Copilot auth`
>
> **Xem hướng dẫn đầy đủ:** [COPILOT.md](COPILOT.md)

### Copilot trong nvim-cmp

Copilot hoạt động như một **completion source** trong nvim-cmp. Suggestions xuất hiện tự động trong completion menu.

**Không cần phím tắt riêng!** Sử dụng keymaps của nvim-cmp:

- `Tab` - Chọn suggestion kế tiếp
- `Shift+Tab` - Chọn suggestion trước
- `Enter` - Chấp nhận suggestion
- `Ctrl+Space` - Trigger completion menu

**Copilot Icon:** Suggestions từ Copilot hiện với icon `` trong completion menu.

**Priority:** Copilot suggestions xuất hiện đầu tiên (priority 1000).

### Lệnh Copilot

| Lệnh | Mô tả |
|------|-------|
| `:Copilot auth` | Xác thực GitHub Copilot lần đầu |
| `:Copilot enable` | Bật Copilot |
| `:Copilot disable` | Tắt Copilot |
| `:Copilot status` | Kiểm tra trạng thái Copilot |

**Tip:** Viết comment mô tả chức năng, Copilot sẽ suggest code phù hợp trong completion menu.

---

## 📝 Todo Comments

Plugin tự động highlight TODO, FIXME, NOTE, HACK, WARNING, PERF trong comments.

| Phím | Chế độ | Mô tả |
|------|--------|-------|
| `]t` | Normal | Next TODO comment |
| `[t` | Normal | Previous TODO comment |
| `<leader>ft` | Normal | Find todos (Telescope) |

**Supported Keywords:**

- `TODO:` - Things to do
- `FIXME:` - Things to fix
- `HACK:` - Temporary solutions
- `WARN:` / `WARNING:` - Warnings
- `PERF:` / `OPTIM:` - Performance optimizations
- `NOTE:` - Important notes

**Example:**

```lua
-- TODO: Implement this feature
-- FIXME: Bug in this function
-- NOTE: This is important
```

---

## 🐙 Git Integration

> **Xem hướng dẫn LazyGit đầy đủ:** [LAZYGIT.md](LAZYGIT.md)

### Gitsigns - Git Hunks

| Phím | Chế độ | Mô tả |
|------|--------|-------|
| `]c` | Normal | Git hunk kế tiếp |
| `[c` | Normal | Git hunk trước |
| `<leader>gp` | Normal | Preview git hunk |
| `<leader>gb` | Normal | Git blame (xem ai sửa dòng này) |

**Git Signs:**

- `✚` - Added line
- `✹` - Changed line
- `✖` - Deleted line
- `~` - Changed and deleted
- `‾` - Top deleted
- `┆` - Untracked

### Fugitive - Git Commands

| Phím | Chế độ | Mô tả |
|------|--------|-------|
| `<leader>gs` | Normal | Git status (mở Fugitive) |

**Lệnh Fugitive:**

- `:Git` hoặc `:G` - Git status
- `:Git add %` - Stage file hiện tại
- `:Git commit` - Commit
- `:Git push` - Push
- `:Git pull` - Pull
- `:Gdiffsplit` - Xem diff
- `:GBrowse` - Mở file trên GitHub

### LazyGit - Terminal UI

| Phím | Chế độ | Mô tả |
|------|--------|-------|
| `<leader>gg` | Normal | Mở LazyGit (Git terminal UI) |
| `<leader>lg` | Normal | Mở LazyGit (phím tắt thay thế) |
| `<leader>gl` | Normal | Git log trong terminal |

**LazyGit Commands:**

- `:LazyGit` - Mở LazyGit
- `:LazyGitCurrentFile` - LazyGit cho file hiện tại
- `:LazyGitFilter` - LazyGit filter view

**Xem hướng dẫn LazyGit UI shortcuts:** [LAZYGIT.md](LAZYGIT.md)

### Mergetool

| Phím | Chế độ | Mô tả |
|------|--------|-------|
| `<leader>mt` | Normal | Bật/tắt Git Mergetool |

**Trong Mergetool:**

- Xem 3 panels: LOCAL, BASE, REMOTE
- Merge result ở bên phải
- Sử dụng `:diffget LOCAL` hoặc `:diffget REMOTE` để chọn version

---

## 💻 Terminal (Floaterm)

### Quản lý Terminal

| Phím | Chế độ | Mô tả |
|------|--------|-------|
| `<leader>to` | Normal/Terminal | Mở terminal mới |
| `<leader>tt` | Normal/Terminal | Bật/tắt terminal |
| `<leader>tn` | Normal/Terminal | Terminal tiếp theo |
| `<leader>tp` | Normal/Terminal | Terminal trước |
| `<leader>tk` | Normal/Terminal | Kill terminal hiện tại |
| `<leader>tf` | Normal/Terminal | Focus terminal (từ editor) |
| `<leader>gl` | Normal | Git log trong terminal |

**Lệnh Floaterm:**

- `:FloatermNew` - Terminal mới
- `:FloatermToggle` - Bật/tắt
- `:FloatermKill` - Kill terminal

**Cấu hình mặc định:**

- Vị trí: Top-right
- Kích thước: 60% width, 80% height
- Floating window với border

---

## 🐛 Debug (Vimspector)

### Debug Controls

| Phím | Chế độ | Mô tả |
|------|--------|-------|
| `<leader>dc` | Normal | Continue (tiếp tục chạy) |
| `<leader>db` | Normal | Toggle breakpoint (đặt/bỏ điểm dừng) |
| `<leader>dB` | Normal | Conditional breakpoint |
| `<leader>dl` | Normal | Run last |
| `<leader>dr` | Normal | Open REPL |
| `<leader>dt` | Normal | Terminate |

**Lệnh Vimspector:**

- `:VimspectorInstall` - Cài debug adapter
- `:VimspectorUpdate` - Cập nhật adapters

**Yêu cầu:** Cần cấu hình `.vimspector.json` cho từng project.

---

## 🦀 Rust Specific

### File Rust (.rs)

| Phím | Chế độ | Mô tả |
|------|--------|-------|
| `<leader>ih` | Normal | Bật/tắt inlay hints |
| `K` | Normal | Rust hover actions (nhiều options hơn) |
| `<leader>a` | Normal | Rust code actions |
| `gd` | Normal | Go to definition |
| `<leader>rn` | Normal | Rename |
| `<leader>f` | Normal | Format code |

**Lệnh Rust:**

- `:RustInlayHintsToggle` - Bật/tắt inlay hints
- `:RustLsp` - Rust LSP commands

**Inlay Hints (tự động bật):**

- Type hints (kiểu dữ liệu)
- Parameter hints (tên tham số)
- Chaining hints (chuỗi method)
- Lifetime elision hints
- Closure return type hints
- Reborrow hints

**Rust Analyzer Features:**

- Clippy integration (linting)
- Cargo features support
- Auto format on save (rustfmt)

### File Cargo.toml

| Phím | Chế độ | Mô tả |
|------|--------|-------|
| `<leader>ct` | Normal | Bật/tắt thông tin crates |
| `<leader>cr` | Normal | Reload crates |
| `<leader>cv` | Normal | Hiện crate features popup |
| `<leader>cu` | Normal/Visual | Update crate/crates |
| `<leader>cU` | Normal/Visual | Upgrade crate/crates |
| `K` | Normal | Hiện crate documentation popup |

**Features crates.nvim:**

- Inline version info
- Upgrade suggestions
- Feature management
- Version completion trong nvim-cmp

---

## 💬 Comments

### Toggle Comments

| Phím | Chế độ | Mô tả |
|------|--------|-------|
| `<leader>cc` | Normal | Toggle line comment |
| `<leader>bc` | Normal | Toggle block comment |
| `<leader>c` | Normal/Visual | Comment operator (motions) |
| `<leader>b` | Normal/Visual | Block comment operator |

**Ví dụ:**

- `<leader>cc` - Comment/uncomment dòng hiện tại
- `<leader>c2j` - Comment 3 dòng (hiện tại + 2 dòng xuống)
- Visual select + `<leader>c` - Comment các dòng đã chọn

---

## 💡 Tips & Tricks

### 🚀 Workflows Thực Tế

#### 1. Code Navigation Workflow

```
1. `F6` để tìm file
2. `gd` để jump to definition
3. `Ctrl+O` để quay lại vị trí trước
4. `gr` để xem tất cả references
5. `<leader>rn` để rename symbol
```

#### 2. Git Workflow với LazyGit

```
1. `<leader>gg` để mở LazyGit
2. Stage files với `space` trong LazyGit
3. `c` để commit
4. `P` để push
5. `q` để thoát LazyGit
```

#### 3. Debugging Workflow

```
1. `<leader>dt` để set breakpoint
2. `<leader>dl` để start debug
3. `<leader>dc` để continue
4. `<leader>di` để step into
5. `<leader>ds` để stop
```

#### 4. Copilot-Driven Development

```
1. Viết comment mô tả chức năng: "// Function to calculate fibonacci"
2. Copilot suggest code
3. `Alt+L` để accept
4. Hoặc `Alt+P` để xem multiple suggestions
```

#### 5. Refactoring với LSP

```
1. Visual select code block
2. `<leader>a` để mở code actions
3. Chọn "Extract to function" hoặc actions khác
4. `<leader>f` để format code sau khi refactor
```

### 🎯 Pro Tips

1. **Buffer Management:**
   - Sử dụng `Shift+L`/`Shift+H` thay vì `:bnext`/`:bprev`
   - `<leader>bd` để đóng buffer mà không đóng window layout

2. **Search & Replace:**
   - Visual select text → `Ctrl+R` → thay thế trong toàn file
   - Hoặc `//` để search text đã chọn

3. **Multi-cursor với Copilot:**
   - Copilot có thể suggest code cho nhiều dòng cùng lúc
   - Viết pattern rõ ràng để Copilot hiểu context

4. **LSP + Treesitter:**
   - LSP cung cấp semantic highlighting
   - Treesitter cung cấp syntax highlighting
   - Kết hợp tạo highlighting chính xác nhất

5. **Terminal Integration:**
   - `<leader>tt` để toggle terminal nhanh
   - Dùng multiple terminals với `<leader>tn`/`<leader>tp`
   - Run commands mà không rời Neovim

6. **Git Blame:**
   - `<leader>gb` để xem ai sửa dòng code
   - Giúp trace code history và tìm nguyên nhân bugs

7. **Diagnostic trong Insert Mode:**
   - `Ctrl+S` để xem diagnostic mà không cần thoát Insert mode
   - Giúp fix lỗi nhanh khi đang code

### 🔥 Advanced Combinations

- **`gd` → `gr` → `<leader>rn`**: Jump to definition → See all references → Rename
- **`<leader>gg` → stage → commit → push**: Quick Git workflow
- **`<leader>fg` → select result → `Enter`**: Tìm và jump nhanh trong project
- **Visual mode → `<leader>ca`**: Refactor code block
- **`[d` → `<leader>ca` → fix**: Jump to diagnostic và fix ngay

---

## 📚 Tài liệu khác

- [COPILOT.md](COPILOT.md) - Hướng dẫn chi tiết GitHub Copilot
- [LAZYGIT.md](LAZYGIT.md) - Hướng dẫn chi tiết LazyGit
- [INSTALLATION.md](INSTALLATION.md) - Hướng dẫn cài đặt
- [PLUGINS.md](PLUGINS.md) - Danh sách plugins chi tiết
- [README.md](README.md) - Overview và quick start

---

**Ghi chú:**

- Tất cả phím tắt được lấy từ config thực tế trong `lua/config/keymaps.lua` và các plugin configs
- Update: January 2025
