# 🔌 Plugins - Danh sách chi tiết

Tài liệu đầy đủ về tất cả plugins trong cấu hình Neovim này.

**Plugin Manager:** [lazy.nvim](https://github.com/folke/lazy.nvim)

## 📑 Mục lục

- [UI & Theme](#-ui--theme)
- [Editor](#-editor)
- [LSP & Completion](#-lsp--completion)
- [UX Enhancements](#-ux-enhancements)
- [Syntax Highlighting](#-syntax-highlighting)
- [Git Integration](#-git-integration)
- [Terminal](#-terminal)
- [Debug](#-debug)
- [Rust Development](#-rust-development)
- [Quản lý Plugins](#-quản-lý-plugins)

---

## 🎨 UI & Theme

### navarasu/onedark.nvim

**Link:** [https://github.com/navarasu/onedark.nvim](https://github.com/navarasu/onedark.nvim)

**Mô tả:** OneDark color scheme với 6 variants (dark, darker, cool, deep, warm, warmer).

**Features:**

- 🎨 6 style variants để lựa chọn
- ✨ High quality syntax highlighting
- 🔗 Lualine integration
- 👁️ Excellent contrast và readability
- 🎯 Treesitter support
- 📦 LSP diagnostics highlighting

**Config:** `lua/plugins/ui.lua`

**Current Style:** `dark`

**Lệnh:**

```vim
:colorscheme onedark
```

---

### famiu/bufdelete.nvim

**Link:** [https://github.com/famiu/bufdelete.nvim](https://github.com/famiu/bufdelete.nvim)

**Mô tả:** Delete buffers mà không đóng windows/splits.

**Features:**

- 🗑️ Delete buffer giữ nguyên window layout
- 🔒 Prevents closing last window
- ⚡ Fast và lightweight
- 🎯 Replacement cho `:bdelete` và `:bwipeout`

**Phím tắt:**

- `<leader>bd` - Delete buffer (keep window)
- `<leader>bw` - Wipeout buffer (keep window)

**Config:** `lua/plugins/ui.lua`

**Lệnh:**

```vim
:Bdelete   " Delete buffer
:Bwipeout  " Wipeout buffer
```

---

### akinsho/bufferline.nvim

**Link:** [https://github.com/akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim)

**Mô tả:** Buffer line với tabs đẹp, hiện danh sách buffers ở top.

**Features:**

- 📑 Tab-like interface cho buffers
- 🔍 LSP diagnostics integration (hiện errors/warnings trên tab)
- 🎨 Customizable styling
- 🖱️ Mouse support (click để switch buffer)

**Phím tắt:**

- `Shift+L` - Buffer tiếp theo
- `Shift+H` - Buffer trước
- `<leader>bd` - Đóng buffer

**Config:** `lua/plugins/ui.lua`

**Dependencies:** `nvim-tree/nvim-web-devicons`

---

### nvim-lualine/lualine.nvim

**Link:** [https://github.com/nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)

**Mô tả:** Modern, fast và customizable statusline written in Lua.

**Features:**

- ⚡ Blazing fast performance
- 🎨 Beautiful default theme matching OneDark
- 📊 Hiện mode, filename, branch, diagnostics, diff
- 🔌 Git integration (branch, diff stats)
- 🐛 LSP diagnostics với icons
- 🔗 Extensions cho nvim-tree, lazy.nvim
- 🌐 Global statusline support

**Current Theme:** `onedark`

**Config:** `lua/plugins/ui.lua`

**Sections:**

- **Left:** Mode, filename, branch
- **Center:** Diagnostics, diff stats
- **Right:** Lazy updates, encoding, fileformat, filetype, progress, location

---

### nvim-tree/nvim-web-devicons

**Link:** [https://github.com/nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)

**Mô tả:** File icons cho Neovim (Lua-based, modern).

**Features:**

- 🎨 Colored icons cho mỗi file type
- ⚡ Fast và lightweight
- 🔗 Used by bufferline, nvim-tree, telescope và plugins khác
- 📦 Supports 100+ file types

**Config:** `lua/plugins/ui.lua` (lazy loaded)

---

### lukas-reineke/indent-blankline.nvim

**Link:** [https://github.com/lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)

**Mô tả:** Indent guides với scope highlighting.

**Features:**

- 📏 Visual indent guides
- 🎯 Current scope highlighting
- 🎨 Customizable characters
- ⚡ Fast và efficient
- 🚫 Smart exclusions (dashboard, help, etc.)

**Config:** `lua/plugins/ui.lua`

**Character:** `│`

**Excluded filetypes:** help, dashboard, NvimTree, alpha, etc.

---

### goolord/alpha-nvim

**Link:** [https://github.com/goolord/alpha-nvim](https://github.com/goolord/alpha-nvim)

**Mô tả:** Fast và customizable dashboard/greeter.

**Features:**

- 🚀 Fast startup screen
- 🎨 ASCII art header (Neovim logo)
- 📋 Quick actions (find files, recent files, config, etc.)
- ⌨️ Keyboard shortcuts
- 🔗 Telescope integration

**Buttons:**

- `f` - Find file (Telescope)
- `n` - New file
- `r` - Recent files
- `g` - Find text (live grep)
- `c` - Config
- `l` - Lazy
- `q` - Quit

**Config:** `lua/plugins/ui.lua`

**Auto-show:** Khi mở Neovim không có arguments

---

### folke/noice.nvim

**Link:** [https://github.com/folke/noice.nvim](https://github.com/folke/noice.nvim)

**Mô tả:** Better UI for messages, cmdline và popups.

**Features:**

- 💬 Beautiful message popups
- ⌨️ Modern command line UI
- 📜 Better LSP documentation rendering
- 🔍 Bottom search, center command palette
- 📝 Long messages in split window

**Dependencies:**

- `MunifTanjim/nui.nvim`
- `rcarriga/nvim-notify`

**Config:** `lua/plugins/ui.lua`

**Presets:**

- Bottom search
- Command palette
- Long message to split
- LSP doc border

---

## 📝 Editor

### nvim-tree/nvim-tree.lua

**Link:** [https://github.com/nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)

**Mô tả:** Modern file explorer written in Lua, thay thế NERDTree.

**Features:**

- 🌳 Modern và fast file tree
- 🎨 Git integration với status icons
- 📁 File operations (create, delete, rename, copy, paste)
- 🔍 File search và filter
- 🎯 Auto update on file changes
- 📂 Smart folder collapse/expand
- ⌨️ Vim-style navigation
- 🖱️ Mouse support
- 🔗 Integration với devicons

**Phím tắt:**

- `F5` - Toggle NvimTree
- `<leader>e` - Toggle NvimTree
- `<leader>o` - Focus NvimTree

**Trong NvimTree:**

- `o` / `Enter` - Open file/folder
- `<C-v>` - Vertical split
- `<C-x>` - Horizontal split
- `<C-t>` - New tab
- `a` - Create file/folder
- `d` - Delete
- `r` - Rename
- `x` - Cut
- `c` - Copy
- `p` - Paste
- `R` - Refresh
- `?` - Help

**Git Icons:**

- `✓` - Staged
- `✗` - Unstaged
- `★` - Untracked
- `➜` - Renamed
- `` - Deleted

**Config:** `lua/plugins/editor.lua`

**Dependencies:** `nvim-tree/nvim-web-devicons`

---

### nvim-telescope/telescope.nvim

**Link:** [https://github.com/nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)

**Mô tả:** Modern fuzzy finder & picker, thay thế FZF.

**Features:**

- 🔍 Fuzzy find files, buffers, help tags
- 🔎 Live grep với preview
- ⚡ Fast native fzf sorter
- 🎨 Beautiful UI với borders
- 📋 Quickfix integration
- 🎯 Multiple selection
- ⌨️ Customizable keymaps
- 🔌 Extensible với many pickers

**Phím tắt:**

- `F6` / `<leader>ff` - Find files
- `<leader>fg` - Live grep
- `<leader>fb` - Find buffers
- `<leader>fh` - Help tags
- `<leader>fo` - Recent files (oldfiles)
- `<leader>fk` - Keymaps
- `<leader>fc` - Commands

**Trong Telescope:**

- `Ctrl+J/K` / `↓/↑` - Navigate
- `Ctrl+N/P` - History
- `Enter` - Open file
- `Ctrl+X` - Horizontal split
- `Ctrl+V` - Vertical split
- `Ctrl+T` - New tab
- `Ctrl+U/D` - Scroll preview
- `Ctrl+Q` - Send to quickfix
- `Tab` - Toggle selection
- `Esc` - Close

**Config:** `lua/plugins/editor.lua`

**Dependencies:**

- `nvim-lua/plenary.nvim`
- `nvim-tree/nvim-web-devicons`
- `nvim-telescope/telescope-fzf-native.nvim` (native sorter)
- `nvim-telescope/telescope-ui-select.nvim` (UI select replacement)

**Pickers:**

- `find_files` - Tìm files
- `live_grep` - Tìm trong content (ripgrep)
- `buffers` - List buffers
- `help_tags` - Neovim help
- `oldfiles` - Recent files
- `keymaps` - All keymaps
- `commands` - All commands

**Theme:** Dropdown theme cho tất cả pickers

---

## 🔧 LSP & Completion

### williamboman/mason.nvim

**Link:** [https://github.com/williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)

**Mô tả:** Package manager cho LSP servers, DAP servers, linters, formatters.

**Features:**

- 📦 Easy installation UI
- 🔄 Automatic updates
- 🌐 Cross-platform support
- 🔌 Integration với LSP config

**Lệnh:**

- `:Mason` - Mở UI
- `:MasonInstall <server>` - Cài server
- `:MasonUninstall <server>` - Gỡ server
- `:MasonLog` - Xem logs

**Pre-installed servers:**

- `lua_ls` - Lua
- `clangd` - C/C++
- `cmake` - CMake
- `pyright` - Python

**Config:** `lua/plugins/coding.lua`

---

### williamboman/mason-lspconfig.nvim

**Link:** [https://github.com/williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)

**Mô tả:** Bridge giữa Mason và nvim-lspconfig.

**Features:**

- 🔗 Auto-install LSP servers
- ⚙️ Automatic server configuration
- 🔄 Sync với Mason

**Config:** `lua/plugins/coding.lua`

---

### neovim/nvim-lspconfig

**Link:** [https://github.com/neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)

**Mô tả:** Quickstart configs cho Neovim LSP.

**Features:**

- 🚀 Native LSP support
- ⚡ Fast và lightweight
- 🔧 Extensive server configs
- **Note:** Config này sử dụng Neovim 0.11+ `vim.lsp.config` API cho server setup và nvim-lspconfig cho utility functions

**LSP Keymaps:**

- `gd` - Go to definition
- `gy` - Go to type definition
- `gi` - Go to implementation
- `gr` - Show references
- `K` - Hover documentation
- `<leader>rn` - Rename
- `<leader>f` - Format
- `<leader>a` - Code action
- `[g` / `]g` - Previous/Next diagnostic
- `Ctrl+S` (Insert) - Show diagnostic

**Configured servers:**

- **clangd** - C/C++
- **cmake** - CMake
- **pyright** - Python
- **lua_ls** - Lua
- **rust-analyzer** - Rust (qua rustaceanvim)

**Config:** `lua/plugins/coding.lua`

---

### hrsh7th/nvim-cmp

**Link:** [https://github.com/hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)

**Mô tả:** Completion engine cho Neovim.

**Features:**

- ⚡ Fast completion
- 🎨 Customizable UI
- 🔌 Multiple sources support
- 📝 Snippet integration
- 🤖 Copilot integration

**Completion Sources:**

1. `nvim_lsp` - LSP completions
2. `copilot` - AI suggestions
3. `luasnip` - Snippets
4. `crates` - Cargo.toml crates
5. `buffer` - Current buffer
6. `path` - File paths
7. `cmdline` - Command line

**Phím tắt:**

- `Tab` - Next item / Expand snippet
- `Shift+Tab` - Previous item
- `Enter` - Confirm
- `Ctrl+Space` - Trigger completion
- `Ctrl+F` / `Ctrl+B` - Scroll docs
- `Ctrl+E` - Abort

**Config:** `lua/plugins/coding.lua`

**Dependencies:**

- `hrsh7th/cmp-nvim-lsp`
- `hrsh7th/cmp-buffer`
- `hrsh7th/cmp-path`
- `hrsh7th/cmp-cmdline`
- `L3MON4D3/LuaSnip`
- `saadparwaiz1/cmp_luasnip`
- `rafamadriz/friendly-snippets`

---

### L3MON4D3/LuaSnip

**Link:** [https://github.com/L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip)

**Mô tả:** Snippet engine viết bằng Lua.

**Features:**

- ⚡ Fast snippet expansion
- 📝 VSCode-style snippets support
- 🔄 Dynamic snippets
- ⌨️ Jump between placeholders

**Phím tắt:**

- `Tab` - Expand/Jump next
- `Shift+Tab` - Jump previous

**Config:** `lua/plugins/coding.lua`

**Dependencies:** `rafamadriz/friendly-snippets` - Snippet collection

---

### windwp/nvim-autopairs

**Link:** [https://github.com/windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs)

**Mô tả:** Auto close brackets, quotes, etc.

**Features:**

- 🔗 Auto-close pairs: (), {}, [], '', ""
- 🌳 Treesitter integration
- 🔌 nvim-cmp integration
- ⚡ Fast typing support

**Config:** `lua/plugins/ux.lua`

---

### numToStr/Comment.nvim

**Link:** [https://github.com/numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim)

**Mô tả:** Smart commenting plugin.

**Features:**

- 💬 Line và block comments
- 🌳 Treesitter integration (smart context)
- ⌨️ Motions support
- 📝 Multi-language support

**Phím tắt:**

- `gcc` - Toggle line comment
- `gbc` - Toggle block comment
- `gc` - Comment operator (linewise)
- `gb` - Comment operator (blockwise)

**Config:** `lua/plugins/ux.lua`

---

### zbirenbaum/copilot.lua & copilot-cmp

**Link:** [copilot.lua](https://github.com/zbirenbaum/copilot.lua) | [copilot-cmp](https://github.com/zbirenbaum/copilot-cmp)

**Mô tả:** GitHub Copilot AI pair programming integration với nvim-cmp.

**Features:**

- 🤖 AI-powered code suggestions
- 🔌 Seamless nvim-cmp integration
- ⚡ Real-time completions trong completion menu
- 🎯 High priority suggestions (1000)
- 📊 Icon `` để nhận diện Copilot suggestions

**Config hiện tại:**

```lua
-- copilot.lua: suggestion và panel disabled
-- Copilot chỉ hoạt động qua nvim-cmp source
require('copilot').setup({
    suggestion = { enabled = false },
    panel = { enabled = false },
})
```

**Sử dụng:**

- Suggestions xuất hiện tự động trong nvim-cmp menu
- Dùng `Tab`/`Shift+Tab` để navigate
- `Enter` để accept
- Icon `` trong menu

**Lệnh:**

- `:Copilot auth` - Authenticate
- `:Copilot enable/disable` - Bật/tắt
- `:Copilot status` - Check status

**Yêu cầu:**

- GitHub Copilot subscription
- Node.js >= 18.x

**Xem hướng dẫn đầy đủ:** [COPILOT.md](COPILOT.md)

**Config:** `lua/plugins/coding.lua`

---

## ✨ UX Enhancements

### rcarriga/nvim-notify

**Link:** [https://github.com/rcarriga/nvim-notify](https://github.com/rcarriga/nvim-notify)

**Mô tả:** Beautiful notification popups, thay thế vim.notify mặc định.

**Features:**

- 🎨 Beautiful animated notifications
- 📍 Position configurable (top-down)
- ⏱️ Timeout customizable
- 🎯 Icons cho từng level (ERROR, WARN, INFO, DEBUG)
- 🔗 Used by noice.nvim

**Notification Levels:**

- `` ERROR
- `` WARN  
- `` INFO
- `` DEBUG
- `✎` TRACE

**Config:** `lua/plugins/ux.lua`

**Override:** Automatically replaces `vim.notify`

---

### folke/todo-comments.nvim

**Link:** [https://github.com/folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim)

**Mô tả:** Highlight và search TODO comments.

**Features:**

- 🎨 Highlight TODO, FIXME, HACK, WARN, PERF, NOTE
- 🔍 Telescope integration để search todos
- 🎯 Jump to next/prev todo
- 📝 Customizable keywords và colors

**Supported Keywords:**

- `TODO:` - Things to do (blue)
- `FIXME:` - Things to fix (red)
- `HACK:` - Temporary solutions (orange)
- `WARN:` / `WARNING:` - Warnings (yellow)
- `PERF:` / `OPTIM:` - Performance optimizations (purple)
- `NOTE:` - Important notes (green)

**Phím tắt:**

- `]t` - Next TODO comment
- `[t` - Previous TODO comment  
- `<leader>ft` - Find todos (Telescope)

**Config:** `lua/plugins/ux.lua`

**Dependencies:** `nvim-lua/plenary.nvim`

---

## 🌈 Syntax Highlighting

### nvim-treesitter/nvim-treesitter

**Link:** [https://github.com/nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

**Mô tả:** Advanced syntax highlighting và code parsing.

**Features:**

- 🌈 Superior syntax highlighting
- 📊 Incremental selection
- 🎯 Context-aware indentation
- ⚡ Faster than regex-based highlighting

**Installed Parsers:**

- Lua, Rust, C/C++, Python
- JSON, HTML, CSS
- JavaScript, TypeScript
- CMake, Bash
- Markdown, Vim, Vimdoc

**Lệnh:**

- `:TSUpdate` - Update parsers
- `:TSInstall <lang>` - Install parser
- `:TSBufEnable highlight` - Enable highlighting

**Incremental Selection:**

- `Enter` - Init/Expand selection
- `Tab` - Scope incremental
- `Backspace` - Decrease

**Config:** `lua/plugins/treesitter.lua`

---

## 🐙 Git Integration

### lewis6991/gitsigns.nvim

**Link:** [https://github.com/lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)

**Mô tả:** Git signs in sign column (modern replacement for vim-gitgutter).

**Features:**

- ✨ Git diff signs in sign column
- 🔍 Hunk preview
- 🕐 Git blame
- ⚡ Fast và async

**Git Signs:**

- `✚` - Added
- `✹` - Changed
- `✖` - Deleted
- `~` - Changed & deleted
- `‾` - Top deleted
- `┆` - Untracked

**Phím tắt:**

- `]c` / `[c` - Next/Previous hunk
- `<leader>gp` - Preview hunk
- `<leader>gb` - Git blame line

**Lệnh:**

- `:Gitsigns toggle_signs` - Toggle signs
- `:Gitsigns toggle_current_line_blame` - Toggle blame

**Config:** `lua/plugins/git.lua`

---

### tpope/vim-fugitive

**Link:** [https://github.com/tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)

**Mô tả:** Git commands trong Neovim.

**Features:**

- 🔧 Full Git integration
- 📊 Git status buffer
- 🔀 Merge/Rebase support
- 🌐 GitHub integration (qua vim-rhubarb)

**Phím tắt:**

- `<leader>gs` - Git status

**Lệnh:**

- `:Git` hoặc `:G` - Git status
- `:Git add %` - Stage current file
- `:Git commit` - Commit
- `:Git push` / `:Git pull`
- `:Gdiffsplit` - Show diff
- `:GBrowse` - Open trên GitHub

**Config:** `lua/plugins/git.lua`

---

### tpope/vim-rhubarb

**Link:** [https://github.com/tpope/vim-rhubarb](https://github.com/tpope/vim-rhubarb)

**Mô tả:** GitHub integration cho Fugitive.

**Features:**

- 🌐 Open files trên GitHub
- 🔗 `:GBrowse` support
- 📝 GitHub URLs

**Config:** `lua/plugins/git.lua`

**Dependencies:** `tpope/vim-fugitive`

---

### samoshkin/vim-mergetool

**Link:** [https://github.com/samoshkin/vim-mergetool](https://github.com/samoshkin/vim-mergetool)

**Mô tả:** 3-way merge conflict resolution tool.

**Features:**

- 🔀 3-way diff view (LOCAL, BASE, REMOTE)
- ⚡ Easy conflict resolution
- 🎯 Visual merge result

**Phím tắt:**

- `<leader>mt` - Toggle Mergetool

**Layout:** Merge result ở right panel

**Config:** `lua/plugins/git.lua`

---

### kdheepak/lazygit.nvim

**Link:** [https://github.com/kdheepak/lazygit.nvim](https://github.com/kdheepak/lazygit.nvim)

**Mô tả:** LazyGit terminal UI integration.

**Features:**

- 🎨 Beautiful Git terminal UI
- ⚡ Floating window trong Neovim
- 🔧 Full Git workflow support
- 🌳 Interactive rebase, cherry-pick, etc.

**Phím tắt:**

- `<leader>gg` / `<leader>lg` - Mở LazyGit
- `<leader>gl` - Git log terminal

**Lệnh:**

- `:LazyGit` - Mở LazyGit
- `:LazyGitCurrentFile` - LazyGit cho file hiện tại
- `:LazyGitFilter` - Filter view

**Yêu cầu:** `lazygit` binary phải được cài

**Xem hướng dẫn đầy đủ:** [LAZYGIT.md](LAZYGIT.md)

**Config:** `lua/plugins/git.lua`

**Window Settings:**

- Size: 90% màn hình
- Border: Rounded box-drawing characters
- Uses plenary.nvim

---

## 💻 Terminal

### voldikss/vim-floaterm

**Link:** [https://github.com/voldikss/vim-floaterm](https://github.com/voldikss/vim-floaterm)

**Mô tả:** Floating terminal trong Neovim.

**Features:**

- 🪟 Floating terminal window
- 🔢 Multiple terminals support
- 🎨 Customizable position & size
- ⚡ Fast toggle

**Phím tắt:**

- `<leader>to` - Open new terminal
- `<leader>tt` - Toggle terminal
- `<leader>tn` / `<leader>tp` - Next/Prev terminal
- `<leader>tk` - Kill terminal
- `<leader>tf` - Focus terminal
- `<leader>gl` - Git log trong terminal

**Lệnh:**

- `:FloatermNew` - New terminal
- `:FloatermToggle` - Toggle
- `:FloatermKill` - Kill terminal

**Config:** `lua/plugins/terminal.lua`

**Settings:**

- Position: Top-right
- Size: 60% width, 80% height
- Shell: PowerShell (Windows) hoặc default shell

---

## 🐛 Debug

### puremourning/vimspector

**Link:** [https://github.com/puremourning/vimspector](https://github.com/puremourning/vimspector)

**Mô tả:** Debug Adapter Protocol (DAP) client.

**Features:**

- 🐛 Full debugging support
- 🎯 Breakpoints, step in/over/out
- 📊 Variable inspection
- 🔧 Multiple language support

**Phím tắt:**

- `<leader>dl` - Launch debugger
- `<leader>ds` - Stop debugger
- `<leader>dc` - Continue
- `<leader>dt` - Toggle breakpoint
- `<leader>dT` - Clear all breakpoints
- `<leader>di` - Step into
- `<leader>do` - Step over
- `<leader>de` - Step out
- `<leader>dr` - Restart

**Lệnh:**

- `:VimspectorInstall` - Install debug adapters
- `:VimspectorUpdate` - Update adapters

**Yêu cầu:** `.vimspector.json` config file trong project

**Config:** `lua/plugins/debug.lua`

---

## 🦀 Rust Development

### mrcjkb/rustaceanvim

**Link:** [https://github.com/mrcjkb/rustaceanvim](https://github.com/mrcjkb/rustaceanvim)

**Mô tả:** Advanced Rust development plugin.

**Features:**

- 🦀 rust-analyzer integration
- 💡 Inlay hints (auto-enabled)
- 🔧 Code actions
- 📊 Clippy linting
- 🎯 Hover actions
- 🍎 **MacOS Support:** Tự động cấu hình `liblldb.dylib` cho debug trên Mac.

**Inlay Hints Types:**

- Type hints
- Parameter hints
- Chaining hints
- Lifetime elision hints
- Closure return type hints
- Reborrow hints

**Phím tắt (Rust files):**

- `<leader>ih` - Toggle inlay hints
- `K` - Rust hover actions (nhiều options)
- `<leader>a` - Rust code actions
- `gd` - Go to definition
- `<leader>rn` - Rename
- `<leader>f` - Format

**Lệnh:**

- `:RustInlayHintsToggle` - Toggle hints
- `:RustLsp` - Rust LSP commands

**Config:** `lua/plugins/rustacean.lua`

**rust-analyzer Settings:**

- Clippy: Enabled
- All features: Enabled
- Comprehensive inlay hints

---

### rust-lang/rust.vim

**Link:** [https://github.com/rust-lang/rust.vim](https://github.com/rust-lang/rust.vim)

**Mô tả:** Rust file support (syntax, etc.).

**Features:**

- 📝 Auto format on save (rustfmt)
- 📖 Doc comment folding
- ⚡ Fast và lightweight

**Config:** `lua/plugins/rustacean.lua`

---

### saecki/crates.nvim

**Link:** [https://github.com/saecki/crates.nvim](https://github.com/saecki/crates.nvim)

**Mô tả:** Cargo.toml dependency management.

**Features:**

- 📦 Inline crate version info
- ⬆️ Upgrade suggestions
- 🔍 Feature management
- 🔌 nvim-cmp integration

**Phím tắt (Cargo.toml):**

- `<leader>ct` - Toggle crates info
- `<leader>cr` - Reload crates
- `<leader>cv` - Show features popup
- `<leader>cu` - Update crate
- `<leader>cU` - Upgrade crate
- `K` - Show crate documentation

**Config:** `lua/plugins/rustacean.lua`

---

## 🔧 Quản lý Plugins

### Lazy.nvim Commands

```vim
:Lazy              " Mở Lazy UI
:Lazy sync         " Install/Update/Clean plugins
:Lazy update       " Update plugins
:Lazy clean        " Remove unused plugins
:Lazy restore      " Restore plugins từ lockfile
:Lazy profile      " Profile startup time
:Lazy log          " View recent updates
:Lazy help         " Show help
```

### Plugin Installation Flow

1. **Automatic (First launch):**

   ```bash
   nvim
   # Lazy.nvim tự động cài tất cả plugins
   ```

2. **Manual sync:**

   ```vim
   :Lazy sync
   ```

3. **Install specific plugin:**
   - Thêm vào config file trong `lua/plugins/`
   - `:Lazy sync`

### Plugin Organization

```
lua/plugins/
├── init.lua        # Lazy.nvim bootstrap
├── ui.lua          # UI plugins
├── editor.lua      # Editor plugins
├── coding.lua      # LSP & completion
├── treesitter.lua  # Syntax highlighting
├── git.lua         # Git plugins
├── terminal.lua    # Terminal
├── debug.lua       # Debugging
└── rustacean.lua   # Rust development
```

**Cách add plugin mới:**

1. Chọn file phù hợp trong `lua/plugins/`
2. Thêm config:

   ```lua
   {
       'author/plugin-name',
       event = "VeryLazy",  -- hoặc lazy loading option khác
       config = function()
           -- Plugin config
       end,
   }
   ```

3. Restart Neovim hoặc `:Lazy sync`

---

## 📚 Resources

### Plugin Manager

- [lazy.nvim](https://github.com/folke/lazy.nvim) - Plugin manager documentation

### Finding Plugins

- [Awesome Neovim](https://github.com/rockerBOO/awesome-neovim) - Curated list
- [Neovim Plugins](https://neovimcraft.com/) - Plugin directory
- [This Week in Neovim](https://this-week-in-neovim.org/) - New plugins

### Learning

- [Neovim Documentation](https://neovim.io/doc/)
- [Learn Lua in Y minutes](https://learnxinyminutes.com/docs/lua/)

---

## 📖 Tài liệu khác

- [KEYMAPS.md](KEYMAPS.md) - Tất cả phím tắt
- [COPILOT.md](COPILOT.md) - Hướng dẫn GitHub Copilot
- [LAZYGIT.md](LAZYGIT.md) - Hướng dẫn LazyGit
- [INSTALLATION.md](INSTALLATION.md) - Hướng dẫn cài đặt
- [README.md](README.md) - Overview

---

**Note:** Tất cả config được verify với Neovim 0.11.0+

**Update:** January 2025
