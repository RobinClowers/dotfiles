local map = vim.keymap.set -- create mapping

-- Inserts the path of the currently edited file into a command
-- Command mode: %%
map('c', '%%', '<C-R>=expand("%:p:h") . "/"<CR>')

-- map quick quit
-- map <leader>qq :qa!<cr>
map('n', '<leader>qq', ':qa!<CR>')

-- Create the current directory
-- nmap <leader>md :silent !mkdir -p %:h<CR>:redraw!<CR>
map('n', '<leader>md', ':silent !mkdir -p %:h<CR>:redraw!<CR>')

-- Copy paste system clipboard
map('', '<leader>y', '"*y')
map('', '<leader>p', '"*p')
map('', '<leader>P', '"*P')
map('', '<leader>gr', '"*gr')

-- Move visual block
map('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true })
map('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true })

-- Replace the current find expression
map('', '<leader>r', ':%s/<C-r>//')


local function copy_filepath_and_lines()
  local filepath = vim.fn.expand('%:p')
  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")

  local result
  if start_line == end_line then
      result = filepath .. ':' .. start_line
  else
      result = filepath .. ':' .. start_line .. '-' .. end_line
  end

  vim.fn.setreg('+', result)
  print('Copied: ' .. result)
  vim.cmd('normal! v')
end

-- Copy relative path to clipboard
map('n', '<leader>yp', function() vim.fn.setreg('+', vim.fn.expand('%')) end)
-- Copy full path to clipboard
map('n', '<leader>yfp', function() vim.fn.setreg('+', vim.fn.expand('%:p')) end)
-- yank selection: Copy path and line number(s)
vim.keymap.set('v', '<leader>s', copy_filepath_and_lines, { desc = 'Copy filepath and line numbers' })
