local map = vim.keymap.set -- create mapping

-- Telescope
local builtin = require('telescope.builtin')
map('n', '<leader>f', builtin.find_files)
map('n', '<leader>g', builtin.live_grep)
map('n', '<leader>b', builtin.buffers)
map('n', '<leader>h', builtin.help_tags)

-- Ack plugin
map('', '<leader>a', ":Ack!<space>")
map('', '<leader>A', ":Ack! <C-R><C-W><CR>")

-- Fugitive
map('', '<leader>gs', ':Git<CR>')
map('', '<leader>gc', ':Git commit<CR>')
map('', '<leader>ga', ':Git add --all<CR>:Gcommit<CR>')
map('', '<leader>gb', ':Git blame<CR>')

-- vim-command-w
map('n', '<leader>w', ':CommandW<CR>')

-- ReplaceWithRegister
map('n', '<Leader>r', '<Plug>ReplaceWithRegisterOperator')
map('n', '<Leader>rr', '<Plug>ReplaceWithRegisterLine')
map('x', '<Leader>r', '<Plug>ReplaceWithRegisterVisual')

-- sideways.vim
map('n', '((', ':SidewaysLeft<CR>', { noremap = true })
map('n', '))', ':SidewaysRight<CR>', { noremap = true })
