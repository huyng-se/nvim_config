# Modern Neovim Configuration

## ✨ Plugins chính

### UI & Theme
- **doums/darcula** - Dark color scheme
- **akinsho/bufferline.nvim** - Buffer line with tabs
- **vim-airline/vim-airline** - Status line
- **nvim-tree/nvim-web-devicons** - File icons

### Editor
- **preservim/nerdtree** - File explorer
- **junegunn/fzf.vim** - Fuzzy finder

### Coding & LSP
- **williamboman/mason.nvim** - LSP/DAP/Linter installer
- **williamboman/mason-lspconfig.nvim** - Mason and lspconfig integration
- **neovim/nvim-lspconfig** - Native LSP configuration
- **hrsh7th/nvim-cmp** - Completion engine
- **L3MON4D3/LuaSnip** - Snippet engine
- **windwp/nvim-autopairs** - Auto close pairs
- **numToStr/Comment.nvim** - Commenting
- **mrcjkb/rustaceanvim** - Rust development
- **saecki/crates.nvim** - Cargo.toml management

### Syntax Highlighting
- **nvim-treesitter/nvim-treesitter** - Advanced syntax highlighting

### Git
- **lewis6991/gitsigns.nvim** - Git signs in sign column
- **tpope/vim-fugitive** - Git commands
- **samoshkin/vim-mergetool** - Merge conflict resolution

### Terminal & Debug
- **voldikss/vim-floaterm** - Floating terminal
- **puremourning/vimspector** - Debug adapter protocol

## 📋 Yêu cầu

- **Neovim >= 0.11.0**
- **Git**
- **Node.js** (tùy chọn)
- **Nerd Font** (khuyến nghị: JetBrainsMono)

## 🚀 Cài đặt

```bash
# Backup config cũ
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.local/share/nvim ~/.local/share/nvim.backup

# Clone repo
git clone https://github.com/huyng-se/nvim_config.git ~/.config/nvim

# Khởi động Neovim
nvim
```

Lazy.nvim sẽ tự động cài đặt tất cả plugins và LSP servers (qua Mason) khi khởi động lần đầu.

## ⌨️ Cheat Sheet - Phím tắt

**Leader key:** `Space`

### 🎯 Chung (General)

| Phím | Chế độ | Mô tả |
|------|--------|-------|
| `Space` | Normal/Visual | Leader key |
| `Shift+H` | Normal | Buffer trước |
| `Shift+L` | Normal | Buffer sau |
| `<leader>bd` | Normal | Đóng buffer (không đóng window) |
| `Esc` | Normal | Xóa highlight tìm kiếm |
| `<` | Visual | Indent trái (giữ visual mode) |
| `>` | Visual | Indent phải (giữ visual mode) |

### 🪟 Quản lý cửa sổ (Window Management)

| Phím | Chế độ | Mô tả |
|------|--------|-------|
| `Alt+Left` | Normal | Thu nhỏ split dọc |
| `Alt+Right` | Normal | Mở rộng split dọc |
| `Alt+Up` | Normal | Thu nhỏ split ngang |
| `Alt+Down` | Normal | Mở rộng split ngang |

### 📁 File Explorer & Tìm kiếm

| Phím | Chế độ | Mô tả |
|------|--------|-------|
| `F5` | Normal | Bật/tắt NERDTree |
| `F6` | Normal | FZF Files (tìm file) |
| `F7` | Normal | FZF Ripgrep (tìm trong nội dung) |

### 🔧 LSP - Code Navigation

| Phím | Chế độ | Mô tả |
|------|--------|-------|
| `gd` | Normal | Go to definition (đi tới định nghĩa) |
| `gy` | Normal | Go to type definition |
| `gi` | Normal | Go to implementation |
| `gr` | Normal | Show references (hiện tham chiếu) |
| `K` | Normal | Hover documentation (xem tài liệu) |
| `<leader>rn` | Normal | Rename symbol (đổi tên) |
| `<leader>f` | Normal | Format code (định dạng code) |
| `<leader>a` | Normal/Visual | Code action |
| `[g` | Normal | Diagnostic trước |
| `]g` | Normal | Diagnostic sau |

### 💡 Completion - Tự động hoàn thành

| Phím | Chế độ | Mô tả |
|------|--------|-------|
| `Tab` | Insert | Item tiếp theo / Mở rộng snippet |
| `Shift+Tab` | Insert | Item trước |
| `Enter` | Insert | Xác nhận completion |
| `Ctrl+Space` | Insert | Kích hoạt completion |
| `Ctrl+F` | Insert | Cuộn xuống docs |
| `Ctrl+B` | Insert | Cuộn lên docs |

### 🐙 Git Integration

| Phím | Chế độ | Mô tả |
|------|--------|-------|
| `]c` | Normal | Git hunk kế tiếp |
| `[c` | Normal | Git hunk trước |
| `<leader>gp` | Normal | Preview git hunk |
| `<leader>gb` | Normal | Git blame (xem ai sửa dòng) |
| `<leader>gs` | Normal | Git status (fugitive) |
| `<leader>mt` | Normal | Bật/tắt Git Mergetool |
| `<leader>gl` | Normal | Git log trong terminal |

### 💻 Terminal - Floating Terminal

| Phím | Chế độ | Mô tả |
|------|--------|-------|
| `<leader>to` | Normal/Terminal | Mở terminal mới |
| `<leader>tt` | Normal/Terminal | Bật/tắt terminal |
| `<leader>tn` | Normal/Terminal | Terminal tiếp theo |
| `<leader>tp` | Normal/Terminal | Terminal trước |
| `<leader>tk` | Normal/Terminal | Kill terminal |

### 🐛 Debug - Vimspector

| Phím | Chế độ | Mô tả |
|------|--------|-------|
| `<leader>dl` | Normal | Khởi động debugger |
| `<leader>ds` | Normal | Dừng debugger |
| `<leader>dc` | Normal | Continue (tiếp tục) |
| `<leader>dt` | Normal | Toggle breakpoint (đặt/bỏ điểm dừng) |
| `<leader>dT` | Normal | Xóa tất cả breakpoints |
| `<leader>di` | Normal | Step into (bước vào hàm) |
| `<leader>do` | Normal | Step over (bước qua) |
| `<leader>de` | Normal | Step out (bước ra) |
| `<leader>dr` | Normal | Restart debugger |

### 🦀 Rust Specific (trong Cargo.toml)

| Phím | Chế độ | Mô tả |
|------|--------|-------|
| `<leader>ct` | Normal | Bật/tắt thông tin crates |
| `<leader>cr` | Normal | Reload crates |
| `<leader>cv` | Normal | Hiện crate features |
| `<leader>cu` | Normal | Update crate |
| `<leader>ca` | Normal | Update tất cả crates |
| `K` | Normal | Hiện crate popup |

### 💬 Comments - Chú thích

| Phím | Chế độ | Mô tả |
|------|--------|-------|
| `<leader>cc` | Normal | Bật/tắt line comment |
| `<leader>bc` | Normal | Bật/tắt block comment |
| `<leader>c` | Normal/Visual | Comment operator |

## 📁 Cấu trúc thư mục

```
nvim_config/
├── init.lua                # Entry point
├── ginit.lua               # GUI settings (neovim-qt)
├── lua/
│   ├── config/
│   │   ├── options.lua    # Cài đặt Vim
│   │   ├── keymaps.lua    # Phím tắt
│   │   └── autocmds.lua   # Autocommands
│   └── plugins/
│       ├── init.lua       # Lazy.nvim setup
│       ├── ui.lua         # Theme, bufferline, airline
│       ├── editor.lua     # File explorer, fuzzy finder
│       ├── coding.lua     # LSP, completion, snippets
│       ├── treesitter.lua # Syntax highlighting
│       ├── git.lua        # Git integration
│       ├── terminal.lua   # Floaterm
│       └── debug.lua      # Vimspector
└── README.md
```

## 🔧 Troubleshooting

### Quản lý Plugins
```vim
:Lazy sync           " Đồng bộ plugins
:Lazy update         " Cập nhật plugins
```

### Quản lý LSP Servers
```vim
:Mason               " Mở Mason UI
:MasonInstall <server>   " Cài server
:LspInfo             " Kiểm tra trạng thái LSP
```

### Treesitter
```vim
:TSUpdate            " Cập nhật parsers
:TSInstall <language>    " Cài parser
```

### Xóa cache và cài lại
```bash
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim
nvim
```

## 🎨 Tùy chỉnh

### Thêm plugins mới
Chỉnh sửa file phù hợp trong `lua/plugins/`:
- UI plugins → `lua/plugins/ui.lua`
- Editor plugins → `lua/plugins/editor.lua`
- Coding plugins → `lua/plugins/coding.lua`

### Thay đổi phím tắt
Chỉnh sửa `lua/config/keymaps.lua`

### Thay đổi cài đặt
Chỉnh sửa `lua/config/options.lua`

## License

This configuration is provided as-is for personal use.
