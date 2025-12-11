-- Enable font for status bar
vim.g.airline_powerline_fonts = 1

-- Theme OneDark
vim.g.airline_theme = 'onedark'

-- Enable Tab bar
vim.g['airline#extensions#tabline#enabled'] = 1

-- Enable Tab seperator
vim.g['airline#extensions#tabline#left_sep'] = ' '
vim.g['airline#extensions#tabline#left_alt_sep'] = '|'

-- Formatter
vim.g['airline#extensions#tabline#formatter'] = 'default'

-- Set Tab name as file name
vim.g['airline#extensions#tabline#fnamemod'] = ':t'

-- Remove warning whitespace
vim.g['airline#extensions#whitespace#enabled'] = 0

-- Disable error section
vim.g.airline_section_error = ''

