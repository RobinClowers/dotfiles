local autocmd = vim.api.nvim_create_autocmd -- execute autocommands
local exec = vim.api.nvim_exec -- execute Vimscript

-- Remove trailing whitespace
autocmd("BufWritePre", {
  pattern = "*",
    callback = function()
    local save = vim.fn.winsaveview()
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.winrestview(save)
  end
})
