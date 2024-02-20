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

-- do I care about this?
-- function! SaveIfModified()
--   if &modified
--     :w
--   endif
-- endfunction
--
-- nmap <leader>rr :redraw!<CR>
--
-- -- key mapping for error navigation
-- nmap <leader>[ :call SaveIfModified()<CR>:cprev<CR>
-- nmap <leader>] :call SaveIfModified()<CR>:cnext<CR>

-- key mapping for ; and , since they do other things now and I don't use marks
-- nnoremap m ;
-- nnoremap M ,

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
