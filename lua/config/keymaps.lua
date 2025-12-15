-- Key mappings configuration
-- Migrated from init.lua with improvements

local map = vim.keymap.set

-- Disable space in normal and visual mode (since it's the leader key)
map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Better escape
map('i', 'jk', '<ESC>', { desc = 'Escape insert mode' })
map('i', 'kj', '<ESC>', { desc = 'Escape insert mode' })

-- Buffer navigation
map('n', '<S-l>', ':bnext<CR>', { silent = true, desc = 'Next buffer' })
map('n', '<S-h>', ':bprev<CR>', { silent = true, desc = 'Previous buffer' })
-- map('n', '<leader>bb', ':Telescope buffers<CR>', { desc = 'Find buffers' })
map('n', '<leader>bd', ':Bdelete<CR>', { desc = 'Delete buffer' })
map('n', '<leader>bw', ':Bwipeout<CR>', { desc = 'Wipeout buffer' })

-- Window navigation with Ctrl+hjkl
map('n', '<C-h>', '<C-w>h', { silent = true, desc = 'Move to left window' })
map('n', '<C-j>', '<C-w>j', { silent = true, desc = 'Move to down window' })
map('n', '<C-k>', '<C-w>k', { silent = true, desc = 'Move to up window' })
map('n', '<C-l>', '<C-w>l', { silent = true, desc = 'Move to right window' })

-- Window management
map('n', '<leader>wv', ':vsplit<CR>', { desc = 'Vertical split' })
map('n', '<leader>ws', ':split<CR>', { desc = 'Horizontal split' })
map('n', '<leader>wc', ':close<CR>', { desc = 'Close window' })
map('n', '<leader>wo', ':only<CR>', { desc = 'Close other windows' })

-- Resize panes (increased step from 1 to 2 for faster resizing)
-- Note: On MacOS, the Option key (Alt) might need configuration in your terminal emulator
-- to act as Meta key for these mappings to work.
map('n', '<M-Right>', ':vertical resize +2<CR>', { silent = true, desc = 'Increase vertical split' })
map('n', '<M-Left>', ':vertical resize -2<CR>', { silent = true, desc = 'Decrease vertical split' })
map('n', '<M-Down>', ':resize +2<CR>', { silent = true, desc = 'Increase horizontal split' })
map('n', '<M-Up>', ':resize -2<CR>', { silent = true, desc = 'Decrease horizontal split' })

-- Clear search highlight (using Esc instead of /\)
map('n', '<Esc>', ':noh<CR>', { silent = true, desc = 'Clear search highlight' })

-- Better indenting (stay in visual mode after indent)
map('v', '<', '<gv', { desc = 'Indent left' })
map('v', '>', '>gv', { desc = 'Indent right' })

-- Search highlighted text in visual mode
vim.cmd("vnoremap // y/\\V<C-R>=escape(@\",'/\\')<CR><CR>")

-- Search and replace in visual mode
map('v', '<C-r>', '"hy:%s/<C-r>h//gc<left><left><left>', { desc = 'Search and replace selected text' })

-- Move lines up/down
map('n', '<A-j>', ':m .+1<CR>==', { desc = 'Move line down' })
map('n', '<A-k>', ':m .-2<CR>==', { desc = 'Move line up' })
map('i', '<A-j>', '<Esc>:m .+1<CR>==gi', { desc = 'Move line down' })
map('i', '<A-k>', '<Esc>:m .-2<CR>==gi', { desc = 'Move line up' })
map('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
map('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

-- Save file
map('n', '<C-s>', ':w<CR>', { desc = 'Save file' })

-- Dashboard
map('n', '<leader>D', ':Alpha<CR>', { desc = 'Open dashboard' })
map('i', '<C-s>', '<Esc>:w<CR>a', { desc = 'Save file' })

-- Quit
map('n', '<leader>qq', ':qa<CR>', { desc = 'Quit all' })
map('n', '<leader>qw', ':wq<CR>', { desc = 'Save and quit' })

-- Better paste
map('v', 'p', '"_dP', { desc = 'Paste without yanking' })

-- Terminal
map('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
map('t', '<C-h>', '<C-\\><C-n><C-w>h', { desc = 'Terminal: move left' })
map('t', '<C-j>', '<C-\\><C-n><C-w>j', { desc = 'Terminal: move down' })
map('t', '<C-k>', '<C-\\><C-n><C-w>k', { desc = 'Terminal: move up' })
map('t', '<C-l>', '<C-\\><C-n><C-w>l', { desc = 'Terminal: move right' })

-- DAP (Debug Adapter Protocol) - only load if DAP is available
local dap_available, dap = pcall(require, 'dap')
if dap_available then
    -- map('n', '<F9>', dap.toggle_breakpoint, { desc = 'DAP: Toggle breakpoint' })
    -- map('n', '<F5>', dap.continue, { desc = 'DAP: Continue' })
    -- map('n', '<F10>', dap.step_over, { desc = 'DAP: Step over' })
    -- map('n', '<F11>', dap.step_into, { desc = 'DAP: Step into' })
    -- map('n', '<F12>', dap.step_out, { desc = 'DAP: Step out' })
    map('n', '<leader>dc', dap.continue, { desc = 'DAP: Continue' })
    map('n', '<leader>db', dap.toggle_breakpoint, { desc = 'DAP: Toggle breakpoint' })
    map('n', '<leader>dB', function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, { desc = 'DAP: Conditional breakpoint' })
    map('n', '<leader>dl', dap.run_last, { desc = 'DAP: Run last' })
    map('n', '<leader>dr', dap.repl.open, { desc = 'DAP: Open REPL' })
    map('n', '<leader>dt', dap.terminate, { desc = 'DAP: Terminate' })
end

-- DAP UI - only load if DAP UI is available
local dapui_available, dapui = pcall(require, 'dapui')
if dapui_available then
    map('n', '<leader>du', dapui.toggle, { desc = 'DAP UI: Toggle' })
    map('n', '<leader>de', function() dapui.eval(vim.fn.input('Expression: ')) end, { desc = 'DAP UI: Evaluate expression' })
end

-- Crates (Cargo.toml) - only load if crates is available
local crates_available, crates = pcall(require, 'crates')
if crates_available then
    map('n', '<leader>ct', crates.toggle, { desc = 'Crates: Toggle info' })
    map('n', '<leader>cr', crates.reload, { desc = 'Crates: Reload' })
    map('n', '<leader>cv', crates.show_versions_popup, { desc = 'Crates: Show versions' })
    map('n', '<leader>cf', crates.show_features_popup, { desc = 'Crates: Show features' })
    map('n', '<leader>cd', crates.show_dependencies_popup, { desc = 'Crates: Show dependencies' })
    map('n', '<leader>cu', crates.update_crate, { desc = 'Crates: Update crate' })
    map('v', '<leader>cu', crates.update_crates, { desc = 'Crates: Update crates' })
    map('n', '<leader>cU', crates.upgrade_crate, { desc = 'Crates: Upgrade crate' })
    map('v', '<leader>cU', crates.upgrade_crates, { desc = 'Crates: Upgrade crates' })
    map('n', '<leader>ca', crates.update_all_crates, { desc = 'Crates: Update all crates' })
    map('n', '<leader>cA', crates.upgrade_all_crates, { desc = 'Crates: Upgrade all crates' })
    map('n', '<leader>cx', crates.expand_plain_crate_to_inline_table, { desc = 'Crates: Expand to inline table' })
    map('n', '<leader>cX', crates.extract_crate_into_table, { desc = 'Crates: Extract into table' })
    map('n', '<leader>co', crates.open_crates_io, { desc = 'Crates: Open crates.io' })
    map('n', '<leader>cO', crates.open_documentation, { desc = 'Crates: Open documentation' })
    map('n', '<leader>ch', crates.open_homepage, { desc = 'Crates: Open homepage' })
    map('n', '<leader>cH', crates.open_repository, { desc = 'Crates: Open repository' })
end


-- Tạo file trắng ngay tại cửa sổ hiện tại
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" }) 
-- Tạo file mới trong cửa sổ chia đôi (Split New)
map("n", "<leader>wn", "<cmd>vnew<cr>", { desc = "Window New (Vertical)" }) -- Chia dọc + file mới
map("n", "<leader>wm", "<cmd>new<cr>",  { desc = "Window New (Horizontal)" }) -- Chia ngang + file mới

-- Đóng tất cả các cửa sổ khác, chỉ giữ lại cửa sổ đang làm việc
map("n", "<leader>wo", "<cmd>only<cr>", { desc = "Close Other Windows" })

-- Đóng tất cả các buffer khác trừ cái đang mở
map("n", "<leader>bo", function()
  local current = vim.api.nvim_get_current_buf()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if buf ~= current and vim.api.nvim_buf_is_loaded(buf) then
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end
end, { desc = "Close Other Buffers" })
