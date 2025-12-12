# Modern Neovim Configuration

Cấu hình Neovim hiện đại với LSP, Completion, GitHub Copilot, và LazyGit integration.

## 📚 Documentation

- **[INSTALLATION.md](INSTALLATION.md)** - Hướng dẫn cài đặt chi tiết cho tất cả OS
- **[KEYMAPS.md](KEYMAPS.md)** - Tất cả phím tắt và workflows
- **[COPILOT.md](COPILOT.md)** - Hướng dẫn đầy đủ GitHub Copilot
- **[LAZYGIT.md](LAZYGIT.md)** - Hướng dẫn đầy đủ LazyGit
- **[PLUGINS.md](PLUGINS.md)** - Danh sách plugins chi tiết

## ✨ Features

- 🎨 **Modern UI** - OneDark theme, bufferline, lualine, dashboard
- 📁 **File Explorer** - NvimTree với Git integration
- 🔍 **Fuzzy Finder** - Telescope với native fzf sorter
- 🔧 **Native LSP** - Mason, nvim-lspconfig với Neovim 0.11+ APIs
- 💡 **Smart Completion** - nvim-cmp với multiple sources
- 🤖 **GitHub Copilot** - AI pair programming
- 🐙 **Git Integration** - Gitsigns, Fugitive, LazyGit, Mergetool
- 💻 **Floating Terminal** - Floaterm
- 🐛 **Debugging** - Vimspector DAP
- 🦀 **Rust Support** - Rustaceanvim với inlay hints
- 🌈 **Treesitter** - Advanced syntax highlighting
- ✨ **UX Enhancements** - Better notifications, todo comments, indent guides

## ✨ Plugins chính

### UI & Theme
- **navarasu/onedark.nvim** - OneDark theme với 6 variants
- **akinsho/bufferline.nvim** - Buffer line with tabs
- **nvim-lualine/lualine.nvim** - Modern status line
- **nvim-tree/nvim-web-devicons** - File icons
- **famiu/bufdelete.nvim** - Delete buffers without closing windows
- **lukas-reineke/indent-blankline.nvim** - Indent guides
- **goolord/alpha-nvim** - Dashboard

### Editor
- **nvim-tree/nvim-tree.lua** - Modern file explorer
- **nvim-telescope/telescope.nvim** - Fuzzy finder & picker
- **nvim-telescope/telescope-fzf-native.nvim** - Native FZF sorter
- **nvim-telescope/telescope-ui-select.nvim** - UI select replacement

### Coding & LSP
- **williamboman/mason.nvim** - LSP/DAP/Linter installer
- **williamboman/mason-lspconfig.nvim** - Mason and lspconfig integration
- **neovim/nvim-lspconfig** - Native LSP configuration
- **hrsh7th/nvim-cmp** - Completion engine
- **zbirenbaum/copilot.lua** - GitHub Copilot AI assistant
- **zbirenbaum/copilot-cmp** - Copilot source for nvim-cmp
- **L3MON4D3/LuaSnip** - Snippet engine
- **windwp/nvim-autopairs** - Auto close pairs
- **numToStr/Comment.nvim** - Commenting
- **mrcjkb/rustaceanvim** - Rust development

### UX Enhancements
- **rcarriga/nvim-notify** - Beautiful notifications
- **folke/todo-comments.nvim** - TODO/FIXME/NOTE highlighting
- **folke/noice.nvim** - Better UI for messages, cmdline and popups

### Syntax Highlighting
- **nvim-treesitter/nvim-treesitter** - Advanced syntax highlighting

### Git
- **lewis6991/gitsigns.nvim** - Git signs in sign column
- **tpope/vim-fugitive** - Git commands
- **kdheepak/lazygit.nvim** - Lazygit terminal UI integration
- **samoshkin/vim-mergetool** - Merge conflict resolution

### Terminal & Debug
- **voldikss/vim-floaterm** - Floating terminal
- **puremourning/vimspector** - Debug adapter protocol

## 📋 Yêu cầu

- **Neovim >= 0.11.0**
- **Git**
- **Node.js >= 18.x** (bắt buộc cho GitHub Copilot)
- **Nerd Font** (khuyến nghị: JetBrainsMono)
- **Lazygit** (tùy chọn, cài đặt để dùng LazyGit integration)
- **GitHub Copilot subscription** (tùy chọn, để dùng AI assistant)

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

### Cài đặt Lazygit (Tùy chọn)

**macOS:**
```bash
brew install lazygit
```

**Linux:**
```bash
# Ubuntu/Debian
sudo add-apt-repository ppa:lazygit-team/release
sudo apt update
sudo apt install lazygit

# Arch Linux
sudo pacman -S lazygit

# Hoặc tải binary từ: https://github.com/jesseduffield/lazygit/releases
```

**Windows:**
```bash
# Với Chocolatey
choco install lazygit

# Với Scoop
scoop install lazygit
```

### Thiết lập GitHub Copilot (Tùy chọn)

1. Đảm bảo có GitHub Copilot subscription
2. Khởi động Neovim
3. Chạy lệnh: `:Copilot auth`
4. Làm theo hướng dẫn để xác thực với GitHub
5. Sau khi xác thực thành công, Copilot sẽ tự động bật

**Xem hướng dẫn đầy đủ:** [COPILOT.md](COPILOT.md)

## ⌨️ Phím tắt cơ bản

**Leader key:** `Space`

### Quick Reference

| Category | Phím tắt | Mô tả |
|----------|----------|-------|
| **File Explorer** | `F5` / `<leader>e` | Toggle NvimTree |
| | `<leader>o` | Focus NvimTree |
| **Fuzzy Finder** | `F6` / `<leader>ff` | Find files (Telescope) |
| | `<leader>fg` | Live grep (Telescope) |
| | `<leader>fb` | Find buffers |
| | `<leader>fo` | Recent files |
| **Buffer** | `Shift+L` / `Shift+H` | Next/Previous buffer |
| | `<leader>bd` | Delete buffer (keep window) |
| **LSP** | `gd` | Go to definition |
| | `K` | Hover documentation |
| | `<leader>rn` | Rename |
| | `<leader>cf` | Format code |
| | `<leader>ca` | Code action |
| | `[d` / `]d` | Previous/Next diagnostic |
| **Completion** | `Tab` / `Shift+Tab` | Navigate items |
| | `Enter` | Confirm |
| | `Ctrl+Space` | Trigger completion |
| **Copilot** | In completion menu | Copilot suggestions (priority 1) |
| **Git** | `<leader>gg` / `<leader>lg` | LazyGit |
| | `<leader>gs` | Git status (Fugitive) |
| | `<leader>gp` | Preview hunk |
| | `<leader>gb` | Git blame |
| | `]c` / `[c` | Next/Prev hunk |
| **Todo** | `]t` / `[t` | Next/Prev TODO comment |
| | `<leader>ft` | Find todos (Telescope) |
| **Terminal** | `<leader>tt` | Toggle terminal |
| | `<leader>to` | New terminal |
| **Debug** | `<leader>dl` | Launch debugger |
| | `<leader>dt` | Toggle breakpoint |
| | `<leader>dc` | Continue |
| **Rust** | `<leader>ih` | Toggle inlay hints |

**Xem tất cả phím tắt:** [KEYMAPS.md](KEYMAPS.md)

## 📁 Cấu trúc thư mục

```
nvim_config/
├── README.md              # Overview (file này)
├── INSTALLATION.md        # Hướng dẫn cài đặt chi tiết
├── KEYMAPS.md            # Tất cả phím tắt
├── COPILOT.md            # Hướng dẫn GitHub Copilot
├── LAZYGIT.md            # Hướng dẫn LazyGit
├── PLUGINS.md            # Danh sách plugins chi tiết
├── init.lua              # Entry point
├── ginit.lua             # GUI settings (neovim-qt)
└── lua/
    ├── config/
    │   ├── options.lua    # Cài đặt Vim
    │   ├── keymaps.lua    # Phím tắt
    │   └── autocmds.lua   # Autocommands
    └── plugins/
        ├── init.lua       # Lazy.nvim setup
        ├── ui.lua         # Theme, bufferline, lualine, dashboard
        ├── editor.lua     # NvimTree, Telescope
        ├── ux.lua         # Autopairs, Comment, notify, todo-comments
        ├── coding.lua     # LSP, completion, Copilot
        ├── treesitter.lua # Syntax highlighting
        ├── git.lua        # Git integration
        ├── terminal.lua   # Floaterm
        ├── debug.lua      # Vimspector
        └── rustacean.lua  # Rust development
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
