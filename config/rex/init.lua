-- Ported from ~/dotfiles/tmux.conf (tmux prefix: C-o).
-- Each tmux `bind X cmd` becomes the sequence `ctrl+o>X`; `bind -n X cmd` is X alone.

-- Prefix C-o twice sends a literal C-o to the pane (tmux: bind C-o send-prefix)
rex.bind("ctrl+o>ctrl+o", "pane.send_key", { key = "ctrl+o" })

-- Reload config (tmux: bind r source-file ~/.tmux.conf)
rex.bind("ctrl+o>r", "client.config.reload")

-- Quick pane cycling (tmux: bind ^F select-pane -t :.+)
rex.bind("ctrl+o>ctrl+f", "pane.focus_next")

-- Switch panes (tmux: prefix h/j/k/l)
rex.bind("ctrl+o>h", "pane.focus.left")
rex.bind("ctrl+o>j", "pane.focus.down")
rex.bind("ctrl+o>k", "pane.focus.up")
rex.bind("ctrl+o>l", "pane.focus.right")

-- Splits and windows (tmux: prefix s / v / % / c)
rex.bind("ctrl+o>s", "pane.split.down")
rex.bind("ctrl+o>v", "pane.split.right")
rex.bind("ctrl+o>shift+5", "pane.split.right") -- % on a US layout
rex.bind("ctrl+o>c", "client.tab.new")

-- Resize panes by 5 (tmux: bind -r ^H/^J/^K/^L resize-pane). Plain sequences need
-- the full chord each time; prefix R enters repeat mode where h/j/k/l keep resizing
-- and escape leaves it.
rex.bind("ctrl+o>ctrl+h", "pane.resize", { direction = "left", amount = 5 })
rex.bind("ctrl+o>ctrl+j", "pane.resize", { direction = "down", amount = 5 })
rex.bind("ctrl+o>ctrl+k", "pane.resize", { direction = "up", amount = 5 })
rex.bind("ctrl+o>ctrl+l", "pane.resize", { direction = "right", amount = 5 })

rex.mode("repeat", { exclusive = true })
rex.bind("ctrl+o>R", "client.mode.enter", { name = "repeat" })
rex.bind("repeat/escape", "client.mode.exit")
rex.bind("repeat/ctrl+h", "pane.resize", { direction = "left", amount = 5 })
rex.bind("repeat/ctrl+j", "pane.resize", { direction = "down", amount = 5 })
rex.bind("repeat/ctrl+k", "pane.resize", { direction = "up", amount = 5 })
rex.bind("repeat/ctrl+l", "pane.resize", { direction = "right", amount = 5 })

-- Select window with meta+number (tmux: M-1..M-9; rex tabs are 1-indexed, so the
-- numbers carry over directly)
rex.bind("alt+1", "client.tab.goto", { index = 1 })
rex.bind("alt+2", "client.tab.goto", { index = 2 })
rex.bind("alt+3", "client.tab.goto", { index = 3 })
rex.bind("alt+4", "client.tab.goto", { index = 4 })
rex.bind("alt+5", "client.tab.goto", { index = 5 })
rex.bind("alt+6", "client.tab.goto", { index = 6 })
rex.bind("alt+7", "client.tab.goto", { index = 7 })
rex.bind("alt+8", "client.tab.goto", { index = 8 })
rex.bind("alt+9", "client.tab.goto", { index = 9 })

-- Smart pane switching (port of vim-tmux-navigator) lives in its own file
require("smart_focus")

-- Zoom (tmux: M-enter resize-pane -Z)
rex.bind("alt+enter", "pane.zoom")

-- Not ported from tmux.conf (no rex counterpart):
--   bind p paste-buffer              -- rex has no paste action; paste with cmd+v
--   bind -n M-space set -q status    -- no status-bar toggle action in rex
--   copy-mode-vi v/r/y and C-hjkl    -- rex scrollback selection is handled by the client
--   tmux-resurrect plugin            -- no counterpart
