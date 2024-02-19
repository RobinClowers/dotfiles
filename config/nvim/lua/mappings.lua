local map = vim.api.nvim_set_keymap -- create mapping

-- Inserts the path of the currently edited file into a command
-- Command mode: %%
-- cmap %% <C-R>=expand("%:p:h") . "/" <CR>
map('c', '%%', '<C-R>=expand("%:p:h") . "/"<CR>', {})

-- map quick quit
-- map <leader>qq :qa!<cr>
map('n', '<leader>qq', ':qa!<CR>', {})


-- Make the current directory
-- nmap <leader>md :silent !mkdir -p %:h<CR>:redraw!<CR>
map('n', '<leader>md', ':silent !mkdir -p %:h<CR>:redraw!<CR>', { noremap = true, silent = true })

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
map('n', '<leader>y', '"*y', {})
map('n', '<leader>p', '"*p', {})
map('n', '<leader>P', '"*P', {})
map('n', '<leader>gr', '"*gr', {})

-- Move visual block
map('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true })
map('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true })

-- Replace the current find expression
map('n', '<leader>r', ':%s/<C-r>//', {})
