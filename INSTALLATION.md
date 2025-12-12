# 🚀 Installation Guide - Hướng dẫn cài đặt

Hướng dẫn chi tiết cài đặt Neovim config từ đầu đến cuối.

## 📑 Mục lục

- [Prerequisites](#-prerequisites)
- [Installation Steps](#-installation-steps)
- [Post-Installation](#-post-installation)
- [Troubleshooting](#-troubleshooting)
- [Clean Reinstall](#-clean-reinstall)

---

## 📋 Prerequisites

### 1. Neovim >= 0.11.0

Config này yêu cầu Neovim version 0.11.0 trở lên.

#### macOS

```bash
# Homebrew (khuyến nghị)
brew install neovim

# MacPorts
sudo port install neovim

# Từ binary
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-macos.tar.gz
tar xzf nvim-macos.tar.gz
sudo mv nvim-macos /usr/local/nvim
echo 'export PATH="/usr/local/nvim/bin:$PATH"' >> ~/.zshrc
```

#### Linux

**Ubuntu/Debian:**
```bash
# PPA (khuyến nghị cho Ubuntu)
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim

# Hoặc từ AppImage
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim
```

**Arch Linux:**
```bash
sudo pacman -S neovim
```

**Fedora/RHEL/CentOS:**
```bash
sudo dnf install neovim

# Hoặc từ COPR
sudo dnf copr enable agriffis/neovim-nightly
sudo dnf install neovim
```

**Build from source (tất cả distros):**
```bash
# Install dependencies
sudo apt install ninja-build gettext cmake unzip curl  # Ubuntu/Debian
sudo pacman -S base-devel cmake unzip ninja curl       # Arch
sudo dnf install ninja-build cmake gcc make unzip curl # Fedora

# Clone và build
git clone https://github.com/neovim/neovim
cd neovim
git checkout stable  # hoặc master cho nightly
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
```

#### Windows

**Chocolatey:**
```powershell
choco install neovim
```

**Scoop:**
```powershell
scoop install neovim
```

**Winget:**
```powershell
winget install Neovim.Neovim
```

**Binary Manual:**
1. Download từ [GitHub Releases](https://github.com/neovim/neovim/releases)
2. Extract vào `C:\Program Files\Neovim`
3. Add `C:\Program Files\Neovim\bin` vào PATH

#### Verify Installation

```bash
nvim --version
```

Nên thấy:
```
NVIM v0.11.0
Build type: Release
...
```

---

### 2. Git

Bắt buộc để clone config và quản lý plugins.

```bash
# macOS
brew install git

# Ubuntu/Debian
sudo apt install git

# Arch Linux
sudo pacman -S git

# Fedora
sudo dnf install git

# Windows (Chocolatey)
choco install git

# Verify
git --version
```

---

### 3. Node.js >= 18.x (Cho Copilot)

Bắt buộc nếu muốn dùng GitHub Copilot.

#### macOS

```bash
# Homebrew
brew install node

# Verify
node --version  # Should be >= v18.0.0
```

#### Linux

**Ubuntu/Debian:**
```bash
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs
```

**Arch Linux:**
```bash
sudo pacman -S nodejs npm
```

**Fedora:**
```bash
sudo dnf install nodejs
```

**Generic (nvm - Node Version Manager):**
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
source ~/.bashrc  # hoặc ~/.zshrc
nvm install 20
nvm use 20
```

#### Windows

**Chocolatey:**
```powershell
choco install nodejs
```

**Scoop:**
```powershell
scoop install nodejs
```

**Manual:**
Download từ [nodejs.org](https://nodejs.org/)

---

### 4. Nerd Font (Khuyến nghị)

Cần Nerd Font để hiện icons đẹp trong NvimTree, bufferline, Telescope, etc.

#### Cài đặt Font

**macOS:**
```bash
# Homebrew
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font

# Hoặc download manual từ:
# https://github.com/ryanoasis/nerd-fonts/releases
```

**Linux:**
```bash
# Download JetBrainsMono Nerd Font
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
curl -fLo "JetBrainsMono Nerd Font Complete.ttf" \
  https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/Regular/JetBrainsMonoNerdFont-Regular.ttf

# Refresh font cache
fc-cache -fv
```

**Windows:**
1. Download từ [Nerd Fonts Releases](https://github.com/ryanoasis/nerd-fonts/releases)
2. Extract file
3. Right-click → Install font
4. Hoặc copy vào `C:\Windows\Fonts`

#### Configure Terminal

Sau khi cài font, config terminal để dùng nó:

**iTerm2 (macOS):**
1. Preferences → Profiles → Text
2. Font → JetBrainsMono Nerd Font
3. Size: 14

**Terminal.app (macOS):**
1. Preferences → Profiles → Text
2. Font → Change → JetBrainsMono Nerd Font

**Alacritty:**
```yaml
# ~/.config/alacritty/alacritty.yml
font:
  normal:
    family: JetBrainsMono Nerd Font
  size: 14.0
```

**Kitty:**
```conf
# ~/.config/kitty/kitty.conf
font_family JetBrainsMono Nerd Font
font_size 14.0
```

**Windows Terminal:**
1. Settings → Profiles → Defaults → Appearance
2. Font face → JetBrainsMono Nerd Font
3. Font size: 12

---

### 5. Ripgrep (Optional - Cho Telescope Live Grep)

Optional, nhưng khuyến nghị để tăng tốc `live_grep` trong Telescope.

```bash
# macOS
brew install ripgrep

# Ubuntu/Debian
sudo apt install ripgrep

# Arch Linux
sudo pacman -S ripgrep

# Fedora
sudo dnf install ripgrep

# Windows (Chocolatey)
choco install ripgrep

# Verify
rg --version
```

**Lưu ý:** Telescope hoạt động được mà không cần ripgrep, nhưng ripgrep sẽ tăng tốc tìm kiếm đáng kể.

---

### 6. LazyGit (Optional)

Tùy chọn, để dùng LazyGit integration.

**Xem hướng dẫn cài đặt đầy đủ:** [LAZYGIT.md](LAZYGIT.md)

**Quick install:**
```bash
# macOS
brew install lazygit

# Ubuntu/Debian
sudo add-apt-repository ppa:lazygit-team/release
sudo apt update
sudo apt install lazygit

# Arch Linux
sudo pacman -S lazygit

# Windows (Chocolatey)
choco install lazygit

# Verify
lazygit --version
```

---

### 7. GitHub Copilot Subscription (Optional)

Tùy chọn, để dùng GitHub Copilot.

**Đăng ký:**
- [GitHub Copilot](https://github.com/features/copilot) - $10/tháng
- [Students](https://education.github.com/) - Miễn phí cho students

**Xem hướng dẫn đầy đủ:** [COPILOT.md](COPILOT.md)

---

## 🔧 Installation Steps

### Step 1: Backup Config Cũ

Nếu đã có Neovim config, backup trước:

```bash
# Backup config directory
mv ~/.config/nvim ~/.config/nvim.backup

# Backup data directory
mv ~/.local/share/nvim ~/.local/share/nvim.backup

# Backup cache (optional)
mv ~/.cache/nvim ~/.cache/nvim.backup
```

**Windows:**
```powershell
# Config
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.backup

# Data
Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.backup
```

---

### Step 2: Clone Repository

Clone config vào Neovim config directory:

```bash
git clone https://github.com/huyng-se/nvim_config.git ~/.config/nvim
```

**Windows:**
```powershell
git clone https://github.com/huyng-se/nvim_config.git $env:LOCALAPPDATA\nvim
```

---

### Step 3: First Launch

Khởi động Neovim lần đầu:

```bash
nvim
```

**Điều gì sẽ xảy ra:**
1. **Lazy.nvim** tự động cài đặt (plugin manager)
2. **Tất cả plugins** được download và cài tự động
3. **Treesitter parsers** được compile
4. **Mason** cài LSP servers (lua_ls, clangd, cmake, pyright)

**Quá trình này mất ~2-5 phút** tùy vào tốc độ mạng.

**Nếu thấy errors:**
- Đợi cho đến khi tất cả plugins cài xong
- Restart Neovim: `:qa` rồi `nvim`

---

### Step 4: Verify Installation

Sau khi khởi động lần đầu:

```vim
" Check Lazy status
:Lazy

" Check Mason LSP servers
:Mason

" Check Treesitter parsers
:TSInstall

" Check Copilot (if installed)
:Copilot status
```

**Nên thấy:**
- ✅ Tất cả plugins installed
- ✅ LSP servers: lua_ls, clangd, cmake, pyright
- ✅ Treesitter parsers: lua, rust, cpp, python, etc.

---

## 🎨 Post-Installation

### 1. Mason LSP Servers

Cài thêm LSP servers cho ngôn ngữ bạn dùng:

```vim
:Mason
```

**Navigate trong Mason UI:**
- `j`/`k` - Di chuyển lên/xuống
- `i` - Install server đang chọn
- `u` - Update server
- `X` - Uninstall server
- `g?` - Help

**LSP servers khuyến nghị:**

| Language | Server | Install command |
|----------|--------|-----------------|
| JavaScript/TypeScript | tsserver | `:MasonInstall typescript-language-server` |
| Go | gopls | `:MasonInstall gopls` |
| Rust | rust-analyzer | Auto via rustaceanvim |
| Java | jdtls | `:MasonInstall jdtls` |
| PHP | intelephense | `:MasonInstall intelephense` |
| Ruby | solargraph | `:MasonInstall solargraph` |
| HTML/CSS | html, cssls | `:MasonInstall html-lsp css-lsp` |
| JSON | jsonls | `:MasonInstall json-lsp` |
| YAML | yamlls | `:MasonInstall yaml-language-server` |

---

### 2. Treesitter Parsers

Cài thêm parsers cho ngôn ngữ khác:

```vim
:TSInstall <language>
```

**Examples:**
```vim
:TSInstall go
:TSInstall java
:TSInstall php
:TSInstall ruby
:TSInstall yaml
:TSInstall dockerfile
```

**Xem tất cả available parsers:**
```vim
:TSInstallInfo
```

---

### 3. GitHub Copilot Setup

Nếu có Copilot subscription:

#### Step 1: Authenticate

```vim
:Copilot auth
```

**Process:**
1. URL sẽ hiện (vd: `https://github.com/login/device`)
2. Device code sẽ hiện (vd: `1234-5678`)
3. Mở URL trong browser
4. Paste device code
5. Authorize GitHub Copilot
6. Done!

#### Step 2: Verify

```vim
:Copilot status
```

Nên thấy: `Copilot: Ready`

#### Step 3: Test

Tạo file mới và test:
```javascript
// Function to calculate fibonacci
function fib
```

Copilot sẽ suggest code (màu xám). Nhấn `Alt+L` để accept.

**Xem hướng dẫn đầy đủ:** [COPILOT.md](COPILOT.md)

---

### 4. Font Configuration

Đảm bảo terminal đang dùng Nerd Font:

**Test icons:**
```bash
nvim
# Press F5 to toggle NvimTree
```

Nên thấy icons đẹp trong NvimTree. Nếu thấy boxes/squares, font chưa được config đúng.

**Fix:**
1. Cài Nerd Font (xem Prerequisites)
2. Config terminal để dùng font đó
3. Restart terminal
4. Test lại

---

### 5. LazyGit Configuration

Nếu đã cài LazyGit:

**Test trong Neovim:**
```vim
:LazyGit
```

**Config floating window size** (nếu muốn):
Edit `lua/plugins/git.lua`:
```lua
vim.g.lazygit_floating_window_scaling_factor = 0.9  -- 0.7 - 0.95
```

**Xem hướng dẫn đầy đủ:** [LAZYGIT.md](LAZYGIT.md)

---

### 6. Shell Configuration

**Optional:** Add alias cho dễ dùng:

**Bash (~/.bashrc):**
```bash
alias vi='nvim'
alias vim='nvim'
```

**Zsh (~/.zshrc):**
```zsh
alias vi='nvim'
alias vim='nvim'
```

**Fish (~/.config/fish/config.fish):**
```fish
alias vi nvim
alias vim nvim
```

Reload shell:
```bash
source ~/.bashrc  # hoặc ~/.zshrc
```

---

## 🔧 Troubleshooting

### Plugin Installation Failed

**Problem:** Plugins không cài được

**Solutions:**
```vim
" 1. Sync lại
:Lazy sync

" 2. Clean và reinstall
:Lazy clean
:Lazy sync

" 3. Check logs
:Lazy log

" 4. Restart Neovim
:qa
nvim
```

---

### LSP Not Working

**Problem:** LSP features không hoạt động (no completion, no go-to-definition)

**Solutions:**

1. **Check LSP attached:**
   ```vim
   :LspInfo
   ```
   Nên thấy attached clients cho file type hiện tại.

2. **Install server qua Mason:**
   ```vim
   :Mason
   " Navigate đến server cần thiết
   " Press 'i' để install
   ```

3. **Check server running:**
   ```vim
   :LspInfo
   " Xem "Configured servers"
   ```

4. **Restart LSP:**
   ```vim
   :LspRestart
   ```

5. **Check logs:**
   ```vim
   :LspLog
   ```

---

### Treesitter Errors

**Problem:** Syntax highlighting không work hoặc có errors

**Solutions:**

1. **Update Treesitter:**
   ```vim
   :TSUpdate
   ```

2. **Reinstall parser:**
   ```vim
   :TSInstall! <language>
   ```

3. **Check compiler:**
   ```bash
   # macOS
   xcode-select --install
   
   # Linux
   sudo apt install build-essential  # Ubuntu/Debian
   sudo pacman -S base-devel         # Arch
   ```

4. **Disable nếu cần:**
   ```vim
   :TSBufDisable highlight
   ```

---

### Icons Not Showing

**Problem:** Thấy boxes/squares thay vì icons

**Solutions:**

1. **Cài Nerd Font** (xem Prerequisites)

2. **Config terminal** để dùng Nerd Font

3. **Restart terminal**

4. **Test:**
   ```bash
   echo -e "\ue0b0 \ue0b1 \ue0b2 \ue0b3"
   ```
   Nên thấy arrows, không phải boxes.

---

### Copilot Not Working

**Problem:** Copilot suggestions không xuất hiện

**Solutions:**

1. **Check Node.js version:**
   ```bash
   node --version  # Phải >= 18.x
   ```

2. **Check status:**
   ```vim
   :Copilot status
   ```

3. **Re-authenticate:**
   ```vim
   :Copilot disable
   :Copilot auth
   ```

4. **Check plugin installed:**
   ```vim
   :Lazy
   " Tìm copilot.lua và copilot-cmp
   ```

**Xem troubleshooting đầy đủ:** [COPILOT.md](COPILOT.md)

---

### Slow Startup

**Problem:** Neovim khởi động chậm

**Solutions:**

1. **Profile startup:**
   ```vim
   :Lazy profile
   ```
   Xem plugins nào slow.

2. **Lazy load more plugins:**
   Edit plugin configs để thêm `lazy = true` hoặc `event = "VeryLazy"`

3. **Disable unused plugins:**
   Comment out trong config files.

---

### Telescope Not Finding Files

**Problem:** Telescope không tìm thấy files

**Solutions:**

1. **Check in git repo:**
   Telescope ignores files trong `.gitignore` by default.

2. **Install ripgrep for faster search:**
   ```bash
   # macOS
   brew install ripgrep
   
   # Linux
   sudo apt install ripgrep  # Ubuntu/Debian
   sudo pacman -S ripgrep    # Arch
   ```

3. **Use different pickers:**
   ```vim
   :Telescope find_files    " Tìm files
   :Telescope live_grep     " Tìm trong content
   :Telescope git_files     " Tìm git files
   ```

---

### LazyGit Not Opening

**Problem:** LazyGit không mở khi nhấn `<leader>gg`

**Solutions:**

1. **Check lazygit installed:**
   ```bash
   which lazygit
   lazygit --version
   ```

2. **Install nếu chưa có** (xem Prerequisites)

3. **Test command:**
   ```vim
   :LazyGit
   ```

4. **Check plugin:**
   ```vim
   :Lazy
   " Tìm lazygit.nvim
   ```

---

## 🗑️ Clean Reinstall

Nếu có vấn đề nghiêm trọng, clean reinstall:

### Step 1: Remove Everything

```bash
# Remove config
rm -rf ~/.config/nvim

# Remove data (plugins, LSP, etc.)
rm -rf ~/.local/share/nvim

# Remove cache
rm -rf ~/.cache/nvim

# Remove state
rm -rf ~/.local/state/nvim
```

**Windows:**
```powershell
Remove-Item -Recurse -Force $env:LOCALAPPDATA\nvim
Remove-Item -Recurse -Force $env:LOCALAPPDATA\nvim-data
```

---

### Step 2: Reinstall

Follow [Installation Steps](#-installation-steps) từ đầu.

---

### Step 3: Restore Backup (Nếu cần)

```bash
# Restore old config
rm -rf ~/.config/nvim
mv ~/.config/nvim.backup ~/.config/nvim

# Restore old data
rm -rf ~/.local/share/nvim
mv ~/.local/share/nvim.backup ~/.local/share/nvim
```

---

## ✅ Verification Checklist

Sau khi cài xong, verify tất cả features:

```
☐ Neovim version >= 0.11.0
☐ Git installed
☐ Node.js >= 18.x (nếu dùng Copilot)
☐ Nerd Font installed và configured
☐ Ripgrep installed (optional, cho Telescope)
☐ LazyGit installed (optional)
☐ All plugins installed (:Lazy)
☐ LSP servers installed (:Mason)
☐ Treesitter parsers installed (:TSInstall)
☐ Icons hiện đúng trong NvimTree
☐ LSP features work (gd, K, <leader>rn)
☐ Completion works (Tab, Enter)
☐ Telescope works (F6, <leader>ff, <leader>fg)
☐ LazyGit opens (<leader>gg)
☐ Copilot works (nếu có subscription)
```

---

## 📚 Next Steps

Sau khi cài xong:

1. **Đọc keymaps:** [KEYMAPS.md](KEYMAPS.md) - Học tất cả phím tắt
2. **Config Copilot:** [COPILOT.md](COPILOT.md) - Nếu có subscription
3. **Learn LazyGit:** [LAZYGIT.md](LAZYGIT.md) - Git workflow
4. **Explore plugins:** [PLUGINS.md](PLUGINS.md) - Tìm hiểu plugins
5. **Customize:** Chỉnh sửa files trong `lua/config/` và `lua/plugins/`

---

## 📖 Tài liệu khác

- [README.md](README.md) - Overview
- [KEYMAPS.md](KEYMAPS.md) - Tất cả phím tắt
- [COPILOT.md](COPILOT.md) - GitHub Copilot guide
- [LAZYGIT.md](LAZYGIT.md) - LazyGit guide
- [PLUGINS.md](PLUGINS.md) - Plugin list

---

**Ghi chú:**
- Installation được test trên macOS, Linux (Ubuntu, Arch), và Windows 11
- Nếu gặp issues, check [Troubleshooting](#-troubleshooting) section
- Hoặc open issue trên GitHub repo

**Update:** January 2025
