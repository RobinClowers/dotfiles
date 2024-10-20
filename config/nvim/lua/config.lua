local set = vim.opt -- global options

-- Backups and swap
set.backup = false
set.writebackup = false
set.swapfile = false
set.backupdir = "~/.vim/backup"
set.directory = "~/.vim/backup"

set.hidden = false
set.history = 10000
set.number = true
set.ruler = true
set.switchbuf = "useopen"
set.encoding= "utf-8"

vim.g.mapleader = ","
set.termguicolors = true

-- Whitespace and Wrapping
-- c - Auto-wrap comments using textwidth
-- q - Allow formatting of comments with 'gq'
-- r - Automatically insert the current comment leader after hitting Enter in Insert mode
-- j - Remove comment leaders when joining lines
set.formatoptions = "cqrj"

set.wrap = false
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true
set.listchars = {
  tab = "-▷",
  trail = "·",
}

-- Search
set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true

-- Status bar
set.laststatus = 2

-- Status line
set.statusline = "%f  %{coc#status()}%{get(b:,'coc_current_function','')}%h%w%m%r%=%-14.(%l,%c%V%) %P"

-- Show (partial) command in the status line
set.showcmd = true

-- Use modeline overrides
set.modeline = true
set.modelines = 10

-- Open splits below and right by default
set.splitbelow = true
set.splitright = true

-- Performance optimizations
set.lazyredraw = true
vim.api.nvim_command("syntax sync minlines=256")

-- Show 2 lines of context
set.scrolloff = 2

-- don't delay when you hit esc in terminal vim, this may make arrow keys not
-- work well when ssh'd in
set.ttimeoutlen = 5

-- Persistent undo
set.undofile = true

set.undolevels = 1000
set.undoreload = 10000

-- Enable automatic folding
set.foldmethod = "indent"
set.foldnestmax = 10
set.foldenable = false
set.foldlevel = 2

-- Make the current window take up most of the screen
set.winwidth = 84

-- We have to have a winheight bigger than we want to set winminheight. But if
-- we set winheight to be huge before winminheight, the winminheight set will
-- fail.
set.winheight = 5
set.winminheight = 5
set.winheight = 999

-- Ack for seaching, the ackprg variable has to be set before ack loads
-- Use ripgrep instead of ack
vim.g.ackprg = 'rg --vimgrep --smart-case --hidden --ignore-file="$HOME/.rgignore"'

-- suda smart edit mode automatically handles writing to files that require sudo
vim.g.suda_smart_edit = 1
