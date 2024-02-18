local exec = vim.api.nvim_exec -- execute Vimscript
local autocmd = vim.api.nvim_create_autocmd -- execute autocommands
local map = vim.api.nvim_set_keymap -- create mapping

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>h', builtin.help_tags, {})

-- Ack plugin
vim.keymap.set('n', '<leader>a', ":Ack!<space>")
vim.keymap.set('n', '<leader>A', ":Ack! <C-R><C-W><CR>")
-- on mac: brew install ripgrep
vim.g.ackprg = 'rg --vimgrep --smart-case --hidden --ignore-file="$HOME/.rgignore"'

-- Fugitive
map('n', '<leader>gs', ':Git<CR>', { noremap = true, silent = true })
map('n', '<leader>gc', ':Git commit<CR>', { noremap = true, silent = true })
map('n', '<leader>ga', ':Git add --all<CR>:Gcommit<CR>', { noremap = true, silent = true })
map('n', '<leader>gb', ':Git blame<CR>', { noremap = true, silent = true })

-- vim-command-w
map('n', '<leader>w', ':CommandW<CR>', { noremap = true, silent = true })

-- ReplaceWithRegister
map('n', '<Leader>r', '<Plug>ReplaceWithRegisterOperator', {})
map('n', '<Leader>rr', '<Plug>ReplaceWithRegisterLine', {})
map('x', '<Leader>r', '<Plug>ReplaceWithRegisterVisual', {})

-- sideways.vim
map('n', '((', ':SidewaysLeft<CR>', { noremap = true, silent = true })
map('n', '))', ':SidewaysRight<CR>', { noremap = true, silent = true })
