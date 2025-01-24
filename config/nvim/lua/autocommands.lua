local autocmd = vim.api.nvim_create_autocmd -- execute autocommands

-- Start in insert mode for commit
autocmd("BufEnter", {
  pattern = "*.git/COMMIT_EDITMSG",
  callback = function()
    vim.cmd('normal gg0')
    if vim.api.nvim_get_current_line() == '' then
        vim.cmd('start')
    end
  end
})

-- Close netrw (file browser) buffers
autocmd("FileType", {
  pattern = "netrw",
  callback = function()
    vim.api.nvim_buf_set_keymap(0, '', '<leader>w', ":bwipeout<CR>", { noremap = true, silent = true })
  end
})
