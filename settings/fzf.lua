local map = vim.keymap.set

-- 1. General FZF Settings
vim.g.fzf_action = {
  ['ctrl-t'] = 'tab split',
  ['ctrl-x'] = 'split',
  ['ctrl-v'] = 'vsplit'
}

vim.g.fzf_layout = {
  window = {
    width = 0.8,
    height = 0.5,
    highlight = 'Comment'
  }
}

vim.g.fzf_preview_window = {'right:50%', 'ctrl-/'}
vim.g.fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

-- 2. Custom Highlight Definitions
-- Định nghĩa các nhóm highlight cơ sở (như fzf_fg, fzf_fgp...) bằng Lua
vim.api.nvim_set_hl(0, 'fzf_fg',      { ctermfg = 14 })
vim.api.nvim_set_hl(0, 'fzf_fgp',     { ctermfg = 3 })
vim.api.nvim_set_hl(0, 'fzf_hl',      { ctermfg = 5 })
vim.api.nvim_set_hl(0, 'fzf_hlp',     { ctermfg = 5 })
vim.api.nvim_set_hl(0, 'fzf_info',    { ctermfg = 6 })
vim.api.nvim_set_hl(0, 'fzf_prompt',  { ctermfg = 6 })
vim.api.nvim_set_hl(0, 'fzf_spinner', { ctermfg = 6 })
vim.api.nvim_set_hl(0, 'fzf_pointer', { ctermfg = 3 })

-- Ánh xạ màu sắc cho FZF sử dụng các nhóm vừa định nghĩa
vim.g.fzf_colors = {
  fg      = {'fg', 'fzf_fg'},
  hl      = {'fg', 'fzf_hl'},
  ['fg+'] = {'fg', 'fzf_fgp'},
  ['hl+'] = {'fg', 'fzf_hlp'},
  info    = {'fg', 'fzf_info'},
  prompt  = {'fg', 'fzf_prompt'},
  pointer = {'fg', 'fzf_pointer'},
  spinner = {'fg', 'fzf_spinner'}
}

-- 3. Custom Commands
-- :Files
vim.api.nvim_create_user_command('Files', function(opts)
  -- Gọi hàm fzf#vim#files thông qua vim.fn
  -- Sử dụng fzf#vim#with_preview để thêm cửa sổ xem trước
  local fzf_opts = vim.fn['fzf#vim#with_preview']({
    options = {'--layout=reverse', '--info=inline'}
  })
  vim.fn['fzf#vim#files'](opts.args, fzf_opts, opts.bang)
end, { bang = true, nargs = '?', complete = 'dir' })

map('n', '<F6>', ':Files<CR>', { silent = true })

-- :Rg
vim.api.nvim_create_user_command('Rg', function(opts)
  -- Xây dựng lệnh rg
  local cmd = 'rg --column --line-number --color=always --smart-case -- ' .. vim.fn.shellescape(opts.args)
  local fzf_opts = {
    options = {'--exact', '--layout=reverse'}
  }
  vim.fn['fzf#vim#grep'](cmd, 1, fzf_opts, opts.bang)
end, { bang = true, nargs = '*' })

map('n', '<F7>', ':Rg<CR>', { silent = true })

-- 4. Environment Variables
-- Ignore some files/folders
vim.env.FZF_DEFAULT_COMMAND = 'find . \\( -name __pycache__ -o -name .git -name .vagrant \\) -prune -o -print'
