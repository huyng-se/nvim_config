# 🔌 Plugins - Danh sách chi tiết

Tài liệu đầy đủ về tất cả plugins trong cấu hình Neovim này.

**Plugin Manager:** [lazy.nvim](https://github.com/folke/lazy.nvim)

## 📑 Mục lục

- [UI & Theme](#-ui--theme)
- [Editor](#-editor)
- [LSP & Completion](#-lsp--completion)
- [Syntax Highlighting](#-syntax-highlighting)
- [Git Integration](#-git-integration)
- [Terminal](#-terminal)
- [Debug](#-debug)
- [Rust Development](#-rust-development)
- [Quản lý Plugins](#-quản-lý-plugins)

---

## 🎨 UI & Theme

### doums/darcula

**Link:** [https://github.com/doums/darcula](https://github.com/doums/darcula)

**Mô tả:** Dark color scheme inspired by JetBrains IDEs (IntelliJ IDEA, PyCharm, WebStorm).

**Features:**
- ✨ Dark theme with high contrast
- 🎨 Syntax highlighting tối ưu cho nhiều ngôn ngữ
- 👁️ Dễ nhìn cho coding lâu dài
- 🔗 Integration tốt với Treesitter

**Config:** `lua/plugins/ui.lua`

**Lệnh:**
```vim
:colorscheme darcula
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

### vim-airline/vim-airline

**Link:** [https://github.com/vim-airline/vim-airline](https://github.com/vim-airline/vim-airline)

**Mô tả:** Status line đẹp và information-rich ở bottom.

**Features:**
- ✈️ Lightweight và fast
- 📊 Hiện mode, file path, file type, encoding
- 🔌 Git branch integration
- 🎨 Theme support (sử dụng 'deus' theme)
- ⚡ Plugin extensions (Fugitive, etc.)

**Config:** `lua/plugins/ui.lua`

**Dependencies:** `vim-airline/vim-airline-themes`

---

### nvim-tree/nvim-web-devicons

**Link:** [https://github.com/nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)

**Mô tả:** File icons cho Neovim (Lua-based, modern).

**Features:**
- 🎨 Colored icons cho mỗi file type
- ⚡ Fast và lightweight
- 🔗 Used by bufferline, FZF, và plugins khác

**Config:** `lua/plugins/ui.lua` (lazy loaded)

---

### ryanoasis/vim-devicons

**Link:** [https://github.com/ryanoasis/vim-devicons](https://github.com/ryanoasis/vim-devicons)

**Mô tả:** Legacy icons cho NERDTree compatibility.

**Features:**
- 🌳 Icons trong NERDTree
- 📁 File type glyphs
- **Yêu cầu:** Nerd Font

**Config:** `lua/plugins/ui.lua`

---

## 📝 Editor

### preservim/nerdtree

**Link:** [https://github.com/preservim/nerdtree](https://github.com/preservim/nerdtree)

**Mô tả:** File explorer tree view.

**Features:**
- 🌳 Tree-based file explorer
- 📁 Bookmark support
- 🔍 File search trong tree
- 🎨 Git status icons (qua plugin)
- ⌨️ Keyboard navigation

**Phím tắt:**
- `F5` - Toggle NERDTree
- Trong NERDTree:
  - `o` - Open file/toggle directory
  - `i` - Horizontal split
  - `s` - Vertical split
  - `t` - New tab
  - `m` - Menu (create, delete, rename)
  - `R` - Refresh
  - `?` - Help

**Config:** `lua/plugins/editor.lua`

**Dependencies:**
- `Xuyuanp/nerdtree-git-plugin` - Git status
- `ryanoasis/vim-devicons` - Icons
- `unkiwii/vim-nerdtree-sync` - Sync với buffer
- `jcharum/vim-nerdtree-syntax-highlight` - Syntax colors

---

### junegunn/fzf & junegunn/fzf.vim

**Link:** [https://github.com/junegunn/fzf](https://github.com/junegunn/fzf) | [fzf.vim](https://github.com/junegunn/fzf.vim)

**Mô tả:** Fuzzy finder - tìm files và content cực nhanh.

**Features:**
- ⚡ Blazing fast fuzzy search
- 🔍 Search files, buffers, lines
- 📝 Ripgrep integration
- 🎨 Preview window
- ⌨️ Keyboard driven

**Phím tắt:**
- `F6` - `:Files` - Tìm files
- `F7` - `:Rg` - Ripgrep tìm trong content
- Trong FZF:
  - `Ctrl+T` - Open in tab
  - `Ctrl+X` - Horizontal split
  - `Ctrl+V` - Vertical split
  - `Ctrl+/` - Toggle preview

**Lệnh:**
- `:Files [path]` - Tìm files
- `:Rg [pattern]` - Ripgrep search
- `:Buffers` - List buffers
- `:BLines` - Search trong buffer hiện tại
- `:Lines` - Search trong tất cả buffers

**Config:** `lua/plugins/editor.lua`

**Yêu cầu:** `ripgrep` để dùng `:Rg`

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

**Config:** `lua/plugins/coding.lua`

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
- `<leader>cc` - Toggle line comment
- `<leader>bc` - Toggle block comment
- `<leader>c` - Comment operator (với motions)
- `<leader>b` - Block comment operator

**Config:** `lua/plugins/coding.lua`

---

### zbirenbaum/copilot.lua & copilot-cmp

**Link:** [copilot.lua](https://github.com/zbirenbaum/copilot.lua) | [copilot-cmp](https://github.com/zbirenbaum/copilot-cmp)

**Mô tả:** GitHub Copilot AI pair programming.

**Features:**
- 🤖 AI-powered code suggestions
- ⚡ Real-time completions
- 🎨 Panel với multiple suggestions
- 🔌 nvim-cmp integration

**Phím tắt:**
- `Alt+L` - Accept suggestion
- `Alt+]` / `Alt+[` - Next/Prev suggestion
- `Ctrl+]` - Dismiss
- `Alt+Enter` - Open panel
- Panel: `]]` / `[[` - Navigate, `Enter` - Accept, `gr` - Refresh

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

### mattn/emmet-vim

**Link:** [https://github.com/mattn/emmet-vim](https://github.com/mattn/emmet-vim)

**Mô tả:** Emmet support cho HTML/CSS.

**Features:**
- ⚡ Fast HTML/CSS expansion
- 📝 Abbreviation support
- 🎨 Works với JSX/TSX

**Filetypes:** html, css, javascript, javascriptreact, typescript, typescriptreact

**Config:** `lua/plugins/coding.lua`

---

### alvan/vim-closetag

**Link:** [https://github.com/alvan/vim-closetag](https://github.com/alvan/vim-closetag)

**Mô tả:** Auto close HTML/XML tags.

**Features:**
- 🔖 Auto close tags
- ⚡ Fast typing support
- 🎨 JSX/TSX support

**Config:** `lua/plugins/coding.lua`

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

**Update:** December 2024
