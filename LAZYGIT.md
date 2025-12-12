# 🐙 LazyGit - Git Terminal UI

Hướng dẫn chi tiết về LazyGit integration trong Neovim.

LazyGit là một terminal UI đẹp mắt và mạnh mẽ cho Git, giúp quản lý Git workflow dễ dàng hơn với interface trực quan.

## 📑 Mục lục

- [Cài đặt](#-cài-đặt)
- [Sử dụng trong Neovim](#-sử-dụng-trong-neovim)
- [LazyGit UI - Phím tắt](#-lazygit-ui---phím-tắt)
- [Workflows Thông Dụng](#-workflows-thông-dụng)
- [Cấu hình](#-cấu-hình)
- [Troubleshooting](#-troubleshooting)
- [Resources](#-resources)

---

## 🚀 Cài đặt

### macOS

```bash
# Homebrew (khuyến nghị)
brew install lazygit

# MacPorts
port install lazygit

# Binary từ GitHub Releases
wget https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_*_Darwin_x86_64.tar.gz
tar xf lazygit_*_Darwin_x86_64.tar.gz lazygit
sudo mv lazygit /usr/local/bin
```

### Linux

#### Ubuntu/Debian

```bash
# PPA (khuyến nghị cho Ubuntu)
sudo add-apt-repository ppa:lazygit-team/release
sudo apt update
sudo apt install lazygit
```

#### Arch Linux

```bash
sudo pacman -S lazygit

# Hoặc từ AUR
yay -S lazygit
```

#### Fedora/RHEL/CentOS

```bash
# COPR repository
sudo dnf copr enable atim/lazygit -y
sudo dnf install lazygit

# Hoặc binary
wget https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_*_Linux_x86_64.tar.gz
tar xf lazygit_*_Linux_x86_64.tar.gz lazygit
sudo mv lazygit /usr/local/bin
```

#### Generic Linux (Binary)

```bash
# Download latest release
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_$(uname -s)_$(uname -m).tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
```

### Windows

#### Chocolatey

```powershell
choco install lazygit
```

#### Scoop

```powershell
scoop install lazygit
```

#### Winget

```powershell
winget install --id=JesseDuffield.lazygit -e
```

#### Binary Manual

1. Download từ [GitHub Releases](https://github.com/jesseduffield/lazygit/releases/latest)
2. Extract file
3. Thêm vào PATH

### Kiểm tra cài đặt

```bash
lazygit --version
```

---

## 🎮 Sử dụng trong Neovim

### Mở LazyGit

Có 3 cách để mở LazyGit trong Neovim:

#### 1. Phím tắt (Khuyến nghị)

| Phím | Mô tả |
|------|-------|
| `<leader>gg` | Mở LazyGit trong floating window |
| `<leader>lg` | Mở LazyGit (phím tắt thay thế) |

#### 2. Lệnh Neovim

```vim
:LazyGit                    " Mở LazyGit
:LazyGitCurrentFile         " LazyGit cho file hiện tại
:LazyGitFilter             " LazyGit filter view
:LazyGitFilterCurrentFile  " LazyGit filter cho file hiện tại
:LazyGitConfig             " Mở LazyGit config
```

#### 3. Terminal bình thường

```bash
# Trong terminal (ngoài Neovim)
lazygit
```

### Thoát LazyGit

| Phím | Mô tả |
|------|-------|
| `q` | Quit LazyGit |
| `Esc` hoặc `q` | Đóng panel/popup hiện tại |

**Neovim Integration Features:**
- Floating window với border đẹp
- Size: 90% màn hình
- Sử dụng neovim remote để mở files
- Integration với plenary.nvim

---

## ⌨️ LazyGit UI - Phím tắt

### Điều hướng chung (General Navigation)

| Phím | Mô tả |
|------|-------|
| `?` | Mở help menu (hiện tất cả phím tắt) |
| `←` `→` hoặc `h` `l` | Di chuyển giữa các panels |
| `↑` `↓` hoặc `k` `j` | Di chuyển trong panel |
| `Ctrl+U` / `Ctrl+D` | Scroll lên/xuống nửa trang |
| `g` / `G` | Jump đến đầu/cuối list |
| `[` / `]` | Previous/Next tab |
| `<` / `>` | Scroll left/right |
| `q` | Quit LazyGit |
| `Esc` | Cancel/Close popup |
| `x` | Mở menu (context menu) |
| `Ctrl+R` | Refresh |
| `:` | Execute custom command |
| `!` | Open terminal trong LazyGit |

### Panel 1: Files (Status)

Panel này hiển thị working tree status.

| Phím | Mô tả |
|------|-------|
| `Space` | Stage/Unstage file |
| `a` | Stage/Unstage all files |
| `d` | Discard changes (xóa thay đổi chưa commit) |
| `D` | Discard all changes |
| `c` | Commit staged files |
| `A` | Amend last commit |
| `e` | Edit file (mở trong Neovim) |
| `o` | Open file (mở với editor mặc định) |
| `i` | Add to `.gitignore` |
| `I` | Add to `.git/info/exclude` |
| `r` | Refresh files |
| `s` | Stash all changes |
| `S` | Stash staged changes |
| `t` | Add tag |
| `C` | Copy file path to clipboard |
| `Enter` | View file diff |
| `f` | Fetch |
| `p` | Pull |
| `P` | Push |
| `M` | Merge branch |
| `R` | Rebase branch |

### Panel 2: Branches

Panel quản lý branches (local + remote).

| Phím | Mô tả |
|------|-------|
| `Space` | Checkout branch |
| `n` | New branch (tạo branch mới) |
| `o` | Create pull request (nếu có gh CLI) |
| `c` | Checkout by name (nhập tên branch) |
| `F` | Force checkout |
| `d` | Delete branch (xóa branch) |
| `D` | Force delete branch |
| `r` | Rebase branch |
| `R` | Rename branch |
| `M` | Merge branch vào branch hiện tại |
| `f` | Fast-forward branch |
| `g` | View reset options |
| `u` | Set upstream |
| `Enter` | View commits của branch |

### Panel 3: Commits (Local Commits)

Panel hiển thị commit history của branch hiện tại.

| Phím | Mô tả |
|------|-------|
| `Enter` | View commit details (files changed) |
| `Space` | Checkout commit |
| `c` | Cherry-pick commit |
| `C` | Copy commit SHA to clipboard |
| `r` | Reword commit (sửa commit message) |
| `R` | Rename commit with editor |
| `g` | Reset to commit |
| `G` | Reset hard to commit |
| `s` | Squash down (gộp commit với commit trước) |
| `f` | Fixup commit (như squash nhưng bỏ message) |
| `d` | Delete commit (drop commit) |
| `e` | Edit commit (sửa commit) |
| `p` | Pick commit (trong rebase) |
| `F` | Create fixup commit |
| `S` | Apply patch |
| `A` | Amend commit với staged changes |
| `t` | Add tag to commit |
| `T` | Revert commit |
| `o` | Open commit trên GitHub/GitLab |
| `Ctrl+O` | Copy commit message |

### Panel 4: Stash

Panel quản lý stashed changes.

| Phím | Mô tả |
|------|-------|
| `Space` | Apply stash |
| `g` | Pop stash (apply và xóa) |
| `d` | Drop stash (xóa không apply) |
| `n` | New branch from stash |
| `r` | Rename stash |
| `Enter` | View stash files |

### Panel 5: Remotes

Panel quản lý remote repositories.

| Phím | Mô tả |
|------|-------|
| `f` | Fetch remote |
| `n` | Add new remote |
| `d` | Remove remote |
| `e` | Edit remote URL |
| `Enter` | View remote branches |

### Trong Diff View

Khi xem diff của file hoặc commit:

| Phím | Mô tả |
|------|-------|
| `↑` `↓` hoặc `j` `k` | Di chuyển trong diff |
| `Ctrl+D` / `Ctrl+U` | Scroll nửa trang |
| `e` | Edit file |
| `o` | Open file |
| `Space` | Stage/Unstage hunk (git add -p) |
| `a` | Stage/Unstage all hunks |
| `Esc` | Exit diff view |

---

## 🔄 Workflows Thông Dụng

### 1. Stage và Commit

**Workflow cơ bản:**

```
1. Mở LazyGit: <leader>gg
2. Panel Files (mặc định)
3. Di chuyển đến file với ↑↓
4. Space để stage file
   - Hoặc 'a' để stage tất cả
5. Enter để xem diff trước khi commit
6. 'c' để commit
7. Nhập commit message
8. Ctrl+S để save (trong editor)
9. 'P' để push
10. 'q' để quit
```

**Stage từng hunk:**
```
1. Enter để xem diff
2. Space trên từng hunk để stage riêng lẻ
3. Esc để quay lại
4. 'c' để commit các hunks đã stage
```

### 2. Tạo Branch Mới

```
1. <leader>gg để mở LazyGit
2. → để chuyển sang panel Branches (hoặc '2')
3. 'n' để tạo branch mới
4. Nhập tên branch
5. Enter để confirm
6. Branch mới được tạo và checkout tự động
```

**Tạo branch từ commit cụ thể:**
```
1. Panel Commits
2. Di chuyển đến commit muốn branch
3. Space để checkout commit
4. Panel Branches → 'n' để tạo branch mới
```

### 3. Merge Branches

**Merge branch khác vào branch hiện tại:**

```
1. Checkout branch đích (branch nhận merge)
2. Panel Branches
3. Di chuyển đến branch muốn merge
4. 'M' để merge
5. Chọn merge option (default: regular merge)
6. Nếu có conflicts, resolve trong Files panel
```

**Resolve merge conflicts:**
```
1. Sau khi merge có conflict
2. Panel Files hiện các files conflict
3. Enter để xem diff
4. 'e' để edit file (mở trong Neovim)
5. Resolve conflicts thủ công
6. Save và đóng file
7. Space để stage file resolved
8. 'c' để commit merge
```

### 4. Rebase Interactive

**Rebase để clean commit history:**

```
1. Panel Commits
2. Di chuyển đến commit gốc (base commit)
3. 'e' để start rebase từ đây
4. Chọn "rebase"
5. Trong rebase mode:
   - 'e' = edit commit
   - 's' = squash (gộp với commit trước)
   - 'f' = fixup (squash bỏ message)
   - 'd' = drop (xóa commit)
   - 'r' = reword (sửa message)
6. Enter để apply rebase
```

**Squash nhiều commits:**
```
1. Panel Commits
2. Di chuyển đến commit muốn giữ
3. 's' trên các commits phía trên để squash xuống
4. Viết lại commit message
5. Save
```

### 5. Stash Changes

**Stash working changes:**

```
1. Panel Files
2. 's' để stash all changes
   - Hoặc 'S' để stash chỉ staged changes
3. Nhập stash message (optional)
4. Enter
```

**Apply stash:**
```
1. Panel Stash (số 4)
2. Di chuyển đến stash cần apply
3. Space để apply (giữ stash)
   - Hoặc 'g' để pop (apply và xóa)
4. Resolve conflicts nếu có
```

### 6. View Git Log

**Xem commit history đẹp:**

```
1. Panel Commits
2. Enter trên commit để xem details
3. Xem files changed, diff
4. '←' để quay lại list
```

**Filter commits:**
```
1. Panel Commits
2. '/' để search
3. Nhập text tìm trong commit message
4. Enter để filter
```

### 7. Cherry-pick Commits

**Copy commit từ branch khác:**

```
1. Panel Branches
2. Enter vào branch có commit cần copy
3. Panel Commits hiện commits của branch đó
4. Di chuyển đến commit cần cherry-pick
5. 'c' để cherry-pick
6. Confirm
7. Resolve conflicts nếu có
```

### 8. Undo/Reset Changes

**Reset uncommitted changes:**
```
1. Panel Files
2. 'd' trên file để discard changes
3. Hoặc 'D' để discard all changes
4. Confirm
```

**Reset commits:**
```
1. Panel Commits
2. Di chuyển đến commit muốn reset về
3. 'g' để xem reset options:
   - soft reset: giữ changes, unstage
   - mixed reset: giữ changes, unstage
   - hard reset: XÓA changes
4. Chọn option
5. Confirm
```

### 9. Working với Remote

**Fetch và Pull:**
```
1. 'f' để fetch trong bất kỳ panel nào
2. 'p' để pull current branch
3. Hoặc panel Remotes để fetch specific remote
```

**Push changes:**
```
1. 'P' để push (capital P)
2. Nếu branch chưa có upstream:
   - Chọn "Set upstream và push"
3. Force push (cẩn thận):
   - 'Shift+P' rồi chọn force push
```

### 10. Tagging

**Tạo tag:**
```
1. Panel Commits
2. Di chuyển đến commit muốn tag
3. 't' để create tag
4. Nhập tag name (vd: v1.0.0)
5. Nhập message (optional)
6. Enter
```

**Push tags:**
```
1. Panel Commits
2. 'P' để push
3. Chọn "Push tags"
```

---

## ⚙️ Cấu hình

### Neovim Settings

Config trong `lua/plugins/git.lua`:

```lua
{
    'kdheepak/lazygit.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        { '<leader>gg', '<cmd>LazyGit<CR>', desc = 'LazyGit' },
        { '<leader>lg', '<cmd>LazyGit<CR>', desc = 'LazyGit (alternative)' },
    },
    config = function()
        -- Floating window settings
        vim.g.lazygit_floating_window_winblend = 0  -- Transparency (0-100)
        vim.g.lazygit_floating_window_scaling_factor = 0.9  -- Size (0-1)
        vim.g.lazygit_floating_window_border_chars = {'╭','─', '╮', '│', '╯','─', '╰', '│'}
        vim.g.lazygit_floating_window_use_plenary = 1
        
        -- Use neovim remote to open files
        vim.g.lazygit_use_neovim_remote = 1
    end,
}
```

### LazyGit Config File

LazyGit có thể customize qua config file.

**Vị trí config:**
- Linux/macOS: `~/.config/lazygit/config.yml`
- Windows: `%APPDATA%\lazygit\config.yml`

**Tạo config file:**

```bash
# Tạo directory nếu chưa có
mkdir -p ~/.config/lazygit

# Tạo config file
nvim ~/.config/lazygit/config.yml
```

**Config mẫu:**

```yaml
# LazyGit config
gui:
  # Theme
  theme:
    lightTheme: false
    activeBorderColor:
      - green
      - bold
    inactiveBorderColor:
      - white
    optionsTextColor:
      - blue
    selectedLineBgColor:
      - blue
    selectedRangeBgColor:
      - blue
    
  # Commit message length
  commitLength:
    show: true
  
  # Mouse support
  mouseEvents: true
  
  # Skip confirm for discard changes (cẩn thận)
  skipDiscardChangeWarning: false
  skipStashWarning: false
  
  # Show file tree instead of list
  showFileTree: true
  
  # Show command log
  showCommandLog: true

# Git settings
git:
  paging:
    colorArg: always
    pager: delta --dark --paging=never
  
  # Commit settings
  commit:
    signOff: false
    
  # Merge tool
  merging:
    manualCommit: false
    
  # Pull with rebase by default
  pull:
    mode: 'rebase'
  
  # Auto fetch
  autoFetch: true
  autoRefresh: true
  
  # Branch sort order
  branchLogCmd: 'git log --graph --color=always --abbrev-commit --decorate --date=relative --pretty=medium {{branchName}} --'
  
  # Diff context lines
  diffContextSize: 3

# Update settings
update:
  method: never  # 'prompt' | 'background' | 'never'

# Refresh rate
refresher:
  refreshInterval: 10
  fetchInterval: 60

# Keybindings (custom)
keybinding:
  universal:
    quit: 'q'
    quit-alt1: '<c-c>'
    return: '<esc>'
    quitWithoutChangingDirectory: 'Q'
    togglePanel: '<tab>'
    prevItem: '<up>'
    nextItem: '<down>'
    prevItem-alt: 'k'
    nextItem-alt: 'j'
    prevPage: ','
    nextPage: '.'
    scrollLeft: 'H'
    scrollRight: 'L'
    gotoTop: '<'
    gotoBottom: '>'
    toggleRangeSelect: 'v'
    rangeSelectDown: '<s-down>'
    rangeSelectUp: '<s-up>'
    prevBlock: '<left>'
    nextBlock: '<right>'
    prevBlock-alt: 'h'
    nextBlock-alt: 'l'
    nextMatch: 'n'
    prevMatch: 'N'
    startSearch: '/'
    optionMenu: 'x'
    optionMenu-alt1: '?'
    select: '<space>'
    goInto: '<enter>'
    confirm: '<enter>'
    remove: 'd'
    new: 'n'
    edit: 'e'
    openFile: 'o'
    scrollUpMain: '<pgup>'
    scrollDownMain: '<pgdown>'
    scrollUpMain-alt1: 'K'
    scrollDownMain-alt1: 'J'
    scrollUpMain-alt2: '<c-u>'
    scrollDownMain-alt2: '<c-d>'
    executeCustomCommand: ':'
    createRebaseOptionsMenu: 'm'
    pushFiles: 'P'
    pullFiles: 'p'
    refresh: 'R'
    createPatchOptionsMenu: '<c-p>'
    nextTab: ']'
    prevTab: '['
    nextScreenMode: '+'
    prevScreenMode: '_'
    undo: 'z'
    redo: '<c-z>'
    filteringMenu: '<c-s>'
    diffingMenu: 'W'
    diffingMenu-alt: '<c-e>'
    copyToClipboard: '<c-o>'
```

### Delta Integration (Đẹp hơn diff)

Cài [delta](https://github.com/dandavison/delta) để có diff đẹp hơn:

```bash
# macOS
brew install git-delta

# Ubuntu/Debian
wget https://github.com/dandavison/delta/releases/download/0.16.5/git-delta_0.16.5_amd64.deb
sudo dpkg -i git-delta_0.16.5_amd64.deb

# Arch Linux
sudo pacman -S git-delta
```

Thêm vào `~/.gitconfig`:

```ini
[core]
    pager = delta

[interactive]
    diffFilter = delta --color-only

[delta]
    navigate = true
    light = false
    side-by-side = true
    line-numbers = true

[merge]
    conflictstyle = diff3

[diff]
    colorMoved = default
```

---

## 🔧 Troubleshooting

### LazyGit không mở được

**Lỗi:** LazyGit không mở khi nhấn `<leader>gg`

**Giải pháp:**
```bash
# 1. Kiểm tra LazyGit đã cài chưa
which lazygit
lazygit --version

# 2. Kiểm tra plugin đã cài trong Neovim
:Lazy

# 3. Reinstall plugin
:Lazy sync
```

### Floating window quá nhỏ/lớn

**Giải pháp:** Điều chỉnh scaling factor trong `lua/plugins/git.lua`:

```lua
vim.g.lazygit_floating_window_scaling_factor = 0.9  -- Thay đổi 0.9 thành 0.7-0.95
```

### Cannot open file from LazyGit

**Lỗi:** Nhấn 'e' trong LazyGit không mở file trong Neovim

**Giải pháp:** Đảm bảo neovim remote được bật:

```lua
vim.g.lazygit_use_neovim_remote = 1
```

### Màu sắc không đẹp

**Giải pháp:** 
1. Sử dụng terminal hỗ trợ true color
2. Cài delta cho diff đẹp hơn (xem phần Config)
3. Customize theme trong `~/.config/lazygit/config.yml`

### LazyGit quá chậm trên repo lớn

**Giải pháp:**
```yaml
# Trong ~/.config/lazygit/config.yml
refresher:
  refreshInterval: 30  # Tăng từ 10 lên 30 giây
git:
  autoFetch: false     # Tắt auto fetch
```

### Conflict với Git config

**Lỗi:** LazyGit behavior khác với git CLI

**Giải pháp:** LazyGit sử dụng global git config. Check:

```bash
git config --global --list
```

Hoặc override trong `~/.config/lazygit/config.yml`

---

## 📚 Resources

### Official Documentation

- [LazyGit GitHub](https://github.com/jesseduffield/lazygit)
- [LazyGit Documentation](https://github.com/jesseduffield/lazygit/blob/master/docs/Config.md)
- [lazygit.nvim Plugin](https://github.com/kdheepak/lazygit.nvim)

### Video Tutorials

- [LazyGit Tutorial - ThePrimeagen](https://www.youtube.com/watch?v=CPLdltN7wgE)
- [LazyGit Full Walkthrough](https://www.youtube.com/results?search_query=lazygit+tutorial)

### Cheat Sheets

- [LazyGit Cheat Sheet](https://github.com/jesseduffield/lazygit/blob/master/docs/keybindings/Keybindings_en.md)
- Nhấn `?` trong LazyGit để xem tất cả phím tắt

### Related

- [Neovim Fugitive](https://github.com/tpope/vim-fugitive) - Alternative Git workflow
- [Git Delta](https://github.com/dandavison/delta) - Beautiful diffs
- [GitHub CLI](https://cli.github.com/) - GitHub integration

---

## 📖 Tài liệu khác

- [KEYMAPS.md](KEYMAPS.md) - Tất cả phím tắt Neovim
- [COPILOT.md](COPILOT.md) - Hướng dẫn GitHub Copilot
- [INSTALLATION.md](INSTALLATION.md) - Hướng dẫn cài đặt
- [PLUGINS.md](PLUGINS.md) - Danh sách plugins
- [README.md](README.md) - Overview

---

**Note:** Tài liệu này được viết cho LazyGit version >= 0.40.0. Một số features có thể khác ở versions cũ hơn.

**Update:** January 2025
