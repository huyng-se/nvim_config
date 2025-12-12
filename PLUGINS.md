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

### navarasu/onedark.nvim

**Link:** [https://github.com/navarasu/onedark.nvim](https://github.com/navarasu/onedark.nvim)

**Mô tả:** OneDark color scheme - Modern dark theme với multiple style variations.

**Features:**
- 🎨 OneDark dark theme (style: dark)
- ✨ Clean và easy-on-eyes color palette
- 🔗 Treesitter support
- 🎯 LSP semantic highlighting
- 📊 Lualine integration
- 🎨 Multiple styles: dark, darker, cool, deep, warm, warmer

**Config:** `lua/plugins/ui.lua`

**Lệnh:**
```vim
# Theme được tự động load khi khởi động
```

**Highlights:**
- Better contrast cho dialogs và popups
- Improved line numbers và cursor line
- Better fold colors
- Terminal với better contrast

---

### nvim-lualine/lualine.nvim

**Link:** [https://github.com/nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)

**Mô tả:** Modern statusline viết bằng Lua - thay thế vim-airline.

**Features:**
- ⚡ Blazing fast và lightweight
- 🎨 OneDark theme integration
- 📊 Git branch, diff, diagnostics
- 🔌 Plugin extensions (nvim-tree, lazy)
- 🌍 Global statusline
- 📝 File info, mode, progress

**Sections:**
- **Left:** Mode, filename, branch
- **Center:** Diagnostics, diff
- **Right:** Lazy updates, encoding, fileformat, filetype, progress, location

**Config:** `lua/plugins/ui.lua`

**Dependencies:** `nvim-tree/nvim-web-devicons`

---

### akinsho/bufferline.nvim

**Link:** [https://github.com/akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim)

**Mô tả:** Buffer line với tabs đẹp, hiện danh sách buffers ở top.

**Features:**
- 📑 Tab-like interface cho buffers
- 🔍 LSP diagnostics integration (hiện errors/warnings trên tab)
- 🎨 Slant separator style
- 🖱️ Mouse support (click để switch buffer)
- 📁 NvimTree offset integration
- 🔧 Buffer close với Bdelete plugin

**Phím tắt:**
- `Shift+L` - Buffer tiếp theo
- `Shift+H` - Buffer trước
- `<leader>bd` - Delete buffer (keep window)
- `<leader>bw` - Wipeout buffer

**Config:** `lua/plugins/ui.lua`

**Dependencies:** `nvim-tree/nvim-web-devicons`

---

### goolord/alpha-nvim

**Link:** [https://github.com/goolord/alpha-nvim](https://github.com/goolord/alpha-nvim)

**Mô tả:** Dashboard (greeter) khi mở Neovim không có file.

**Features:**
- 🎨 Beautiful ASCII art header
- 🔘 Quick action buttons
- ⚡ Auto-show khi no file opened
- 🎯 Telescope integration

**Quick Actions:**
- Find file (Telescope)
- New file
- Recent files
- Find text (Live grep)
- Config
- Lazy
- Quit

**Config:** `lua/plugins/ui.lua`

---

### lukas-reineke/indent-blankline.nvim

**Link:** [https://github.com/lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)

**Mô tả:** Indent guides với scope highlighting.

**Features:**
- 📏 Visual indent guides
- 🎯 Scope highlighting (hiện block hiện tại)
- 🎨 Clean vertical lines
- 🚫 Smart exclude cho special filetypes

**Config:** `lua/plugins/ui.lua`

**Excluded Filetypes:** help, dashboard, NvimTree, Trouble, alpha

---

### rcarriga/nvim-notify

**Link:** [https://github.com/rcarriga/nvim-notify](https://github.com/rcarriga/nvim-notify)

**Mô tả:** Better notifications với animations.

**Features:**
- 🔔 Beautiful notification popups
- ⏱️ Auto-dismiss timeout
- 🎨 Icons cho từng level (DEBUG, ERROR, INFO, WARN)
- 🎬 Fade in/slide out animations
- 🔗 Integration với Noice

**Config:** `lua/plugins/ux.lua` + `lua/plugins/ui.lua` (qua Noice)

---

### folke/noice.nvim

**Link:** [https://github.com/folke/noice.nvim](https://github.com/folke/noice.nvim)

**Mô tả:** Enhanced UI cho messages, cmdline, và popups.

**Features:**
- 💬 Better command palette (center position)
- 🔍 Bottom search interface
- 📝 Long messages in split
- 🎨 Markdown rendering cho LSP docs
- 🔗 nvim-notify integration

**Config:** `lua/plugins/ui.lua`

**Dependencies:** `MunifTanjim/nui.nvim`, `rcarriga/nvim-notify`

---

### famiu/bufdelete.nvim

**Link:** [https://github.com/famiu/bufdelete.nvim](https://github.com/famiu/bufdelete.nvim)

**Mô tả:** Delete buffers without closing windows.

**Features:**
- 🗑️ Delete buffer mà không đóng window/split
- 🔧 Giữ window layout intact
- ⚡ Bdelete và Bwipeout commands

**Phím tắt:**
- `<leader>bd` - Delete buffer (keep window)
- `<leader>bw` - Wipeout buffer (keep window)

**Config:** `lua/plugins/ui.lua`

---

### nvim-tree/nvim-web-devicons

**Link:** [https://github.com/nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)

**Mô tả:** File icons cho Neovim (Lua-based, modern).

**Features:**
- 🎨 Colored icons cho mỗi file type
- ⚡ Fast và lightweight
- 🔗 Used by bufferline, Telescope, NvimTree, và plugins khác

**Config:** `lua/plugins/ui.lua` (lazy loaded)

**Yêu cầu:** Nerd Font (e.g., JetBrainsMono Nerd Font)

---

## 📝 Editor

### nvim-tree/nvim-tree.lua

**Link:** [https://github.com/nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)

**Mô tả:** Modern file explorer tree view viết bằng Lua - thay thế NERDTree.

**Features:**
- 🌳 Tree-based file explorer
- 🎨 Git status integration
- 📊 LSP diagnostics on files
- 🖱️ Mouse support
- ⌨️ Keyboard navigation
- 🔄 Auto-reload on file changes
- 📁 Sync with current directory
- 🎯 Indent markers

**Phím tắt:**
- `F5` hoặc `<leader>e` - Toggle NvimTree
- `<leader>o` - Focus NvimTree

**Trong NvimTree:**
- `o` - Open file/toggle directory
- `<CR>` - Open file
- `<C-v>` - Vertical split
- `<C-x>` - Horizontal split
- `<C-t>` - New tab
- `a` - Create new file/folder
- `d` - Delete
- `r` - Rename
- `x` - Cut
- `c` - Copy
- `p` - Paste
- `y` - Copy name
- `Y` - Copy relative path
- `gy` - Copy absolute path
- `R` - Refresh
- `H` - Toggle hidden files
- `?` - Help

**Git Status Icons:**
- `✓` - Staged
- `✗` - Unstaged
- `★` - Untracked
- `➜` - Renamed
- `═` - Unmerged
- `✖` - Deleted
- `◌` - Ignored

**Config:** `lua/plugins/editor.lua`

**Dependencies:**
- `nvim-tree/nvim-web-devicons` - Icons

---

### nvim-telescope/telescope.nvim

**Link:** [https://github.com/nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)

**Mô tả:** Fuzzy finder - tìm files và content cực nhanh - thay thế FZF.

**Features:**
- ⚡ Blazing fast fuzzy search
- 🔍 Search files, buffers, text, help tags, keymaps
- 📝 Ripgrep integration (live_grep)
- 🎨 Beautiful UI với preview
- ⌨️ Keyboard driven
- 🔌 Extensible với nhiều extensions
- 🎯 vim.ui.select integration

**Phím tắt:**
- `F6` hoặc `<leader>ff` - Find files
- `<leader>fg` - Live grep (search in files)
- `<leader>fb` - Find buffers
- `<leader>fh` - Help tags
- `<leader>fo` - Recent files (oldfiles)
- `<leader>fk` - Keymaps
- `<leader>fc` - Commands

**Trong Telescope:**
- `Ctrl+J/K` hoặc `Up/Down` - Navigate items
- `Enter` - Select
- `Ctrl+X` - Horizontal split
- `Ctrl+V` - Vertical split
- `Ctrl+T` - New tab
- `Ctrl+U/D` - Scroll preview
- `Ctrl+Q` - Send to quickfix
- `Tab` - Toggle selection
- `Ctrl+C` hoặc `Esc` - Close

**Lệnh:**
- `:Telescope find_files` - Tìm files
- `:Telescope live_grep` - Ripgrep search
- `:Telescope buffers` - List buffers
- `:Telescope oldfiles` - Recent files
- `:Telescope help_tags` - Help tags
- `:Telescope keymaps` - Show keymaps
- `:Telescope commands` - Show commands

**Config:** `lua/plugins/editor.lua`

**Yêu cầu:**
- `ripgrep` để dùng live_grep
- `make` để build fzf-native extension

**Dependencies:**
- `nvim-lua/plenary.nvim`
- `nvim-tree/nvim-web-devicons`
- `nvim-telescope/telescope-fzf-native.nvim`
- `nvim-telescope/telescope-ui-select.nvim`

---

### nvim-telescope/telescope-fzf-native.nvim

**Link:** [https://github.com/nvim-telescope/telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)

**Mô tả:** FZF sorter for Telescope (native C implementation).

**Features:**
- ⚡ Faster fuzzy matching
- 🎯 Better sorting algorithm
- 🔧 Compiled binary (requires `make`)

**Config:** `lua/plugins/editor.lua` (loaded as Telescope extension)

**Build:** `make` (automatic during plugin installation)

---

### nvim-telescope/telescope-ui-select.nvim

**Link:** [https://github.com/nvim-telescope/telescope-ui-select.nvim](https://github.com/nvim-telescope/telescope-ui-select.nvim)

**Mô tả:** Replace vim.ui.select với Telescope picker.

**Features:**
- 🎨 Beautiful UI cho selections
- 🔧 Code actions qua Telescope
- ⌨️ Consistent interface

**Config:** `lua/plugins/editor.lua` (loaded as Telescope extension)

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
- `<leader>cf` - Format code
- `<leader>ca` - Code action
- `[d` / `]d` - Previous/Next diagnostic

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

**Completion Sources (Priority Order):**
1. `copilot` - AI suggestions (priority 1000)
2. `nvim_lsp` - LSP completions (priority 900)
3. `luasnip` - Snippets (priority 750)
4. `path` - File paths
5. `buffer` - Current buffer

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
- `gcc` - Toggle line comment (current line)
- `gbc` - Toggle block comment (current block)
- `gc` + motion - Comment linewise (e.g., `gcap` comment paragraph)
- `gb` + motion - Comment blockwise
- Visual mode: `gc` - Toggle linewise, `gb` - Toggle blockwise

**Extra mappings:**
- `gcO` - Comment line above
- `gco` - Comment line below
- `gcA` - Comment end of line

**Config:** `lua/plugins/ux.lua`

---

### folke/todo-comments.nvim

**Link:** [https://github.com/folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim)

**Mô tả:** Highlight và search TODO comments.

**Features:**
- 🎨 Highlight TODO, FIXME, NOTE, etc.
- 🔍 Telescope integration
- ⚡ Jump to next/prev todo
- 📝 Customizable keywords

**Phím tắt:**
- `]t` - Next todo comment
- `[t` - Previous todo comment
- `<leader>ft` - Find todos (Telescope)

**Keywords Highlighted:**
- `TODO` - Things to do
- `FIXME` - Things to fix
- `HACK` - Hacky solutions
- `WARN` - Warnings
- `PERF` - Performance issues
- `NOTE` - Notes
- `TEST` - Test related

**Config:** `lua/plugins/ux.lua`

**Dependencies:** `nvim-lua/plenary.nvim`

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
- Suggestions hiện trong nvim-cmp menu (không còn inline suggestions)
- `Tab` / `Shift+Tab` - Navigate cmp items (bao gồm Copilot suggestions)
- `Enter` - Accept selected item
- `Alt+P` - Open Copilot panel (xem multiple suggestions)
- Panel: `]]` / `[[` - Navigate, `Enter` - Accept, `gr` - Refresh

**Configuration:**
- `suggestion = { enabled = false }` - Suggestions qua nvim-cmp only
- `panel = { enabled = false }` - Panel có thể mở thủ công
- Priority: 1000 (cao nhất trong nvim-cmp sources)

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

**Mô tả:** Advanced Rust development plugin (v6+).

**Features:**
- 🦀 rust-analyzer integration
- 💡 Inlay hints (auto-enabled on attach)
- 🔧 Code actions
- 📊 Clippy linting
- 🎯 Hover actions
- 🐛 DAP debugging integration (codelldb)

**Inlay Hints Types (All Enabled):**
- Type hints với renderColons
- Parameter hints
- Chaining hints
- Lifetime elision hints
- Closure return type hints
- Reborrow hints
- Binding mode hints
- Closing brace hints

**Phím tắt (Rust files):**
- `<leader>ih` - Toggle inlay hints
- `K` - Rust hover actions (nhiều options)
- `<leader>a` - Rust code actions
- `gd` - Go to definition
- `<leader>rn` - Rename
- `<leader>f` - Format

**Debugging (Rustaceanvim):**
- `<leader>db` - Show debuggables (Rust)
- `<leader>dr` - Run Rust program
- `<leader>dt` - Run Rust tests
- **Note:** `<leader>dt` có conflict với Vimspector toggle breakpoint

**Lệnh:**
- `:RustLsp` - Rust LSP commands
- `:RustLsp hover actions` - Hover actions
- `:RustLsp codeAction` - Code actions

**Config:** `lua/plugins/rustacean.lua`

**rust-analyzer Settings:**
- Clippy: Enabled
- All features: Enabled
- Comprehensive inlay hints
- Auto-enabled on file open

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
├── ui.lua          # UI plugins (theme, lualine, bufferline, dashboard, noice, notify)
├── editor.lua      # Editor plugins (nvim-tree, telescope)
├── coding.lua      # LSP & completion (mason, lsp, cmp, copilot)
├── treesitter.lua  # Syntax highlighting
├── git.lua         # Git plugins (gitsigns, fugitive, lazygit, mergetool)
├── terminal.lua    # Terminal (floaterm)
├── debug.lua       # Debugging (vimspector)
├── rustacean.lua   # Rust development (rustaceanvim, crates)
└── ux.lua          # UX plugins (autopairs, comment, todo-comments, notify)
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
