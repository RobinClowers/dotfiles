local map = vim.keymap.set -- create mapping

-- Seamless vim/rex pane navigation, matching vim-tmux-navigator's tmux behavior:
-- C-h/j/k/l moves the vim window when one lies that way and asks rex to move its
-- pane when it doesn't. Rex's side is the smart_focus action in
-- ~/.config/rex/smart_focus.lua, which passes the key through to vim. Only active
-- inside a rex pane and outside tmux, where vim-tmux-navigator keeps its job.
if vim.env.REX_SESSION ~= nil and vim.env.TMUX == nil then
  local rex_directions = { h = "left", j = "down", k = "up", l = "right" }
  for key, direction in pairs(rex_directions) do
    map('n', '<C-' .. key .. '>', function()
      local before = vim.api.nvim_get_current_win()
      vim.cmd('wincmd ' .. key)
      if vim.api.nvim_get_current_win() == before then
        -- no vim split that way: move the rex pane instead
        vim.fn.system({ 'rex', 'do', '-s', vim.env.REX_SESSION, '-e',
          'rex.session.focus_direction{ direction = "' .. direction .. '" }' })
      end
    end, { silent = true })
  end
end
