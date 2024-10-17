return {
	"tpope/vim-fugitive",

	-- Github integration
	"tpope/vim-rhubarb",

	-- Surrond stuff with things. ysiw" surrounds a word with quotes
	-- cs"" changes " to "
	"tpope/vim-surround",

	-- Lets you use . to repeat some things like vim-surround
	"tpope/vim-repeat",

	-- Comment with gc (takes a motion) or ^_^_
	"tomtom/tcomment_vim",

	-- Telescope file finder
	"nvim-lua/plenary.nvim",
	{ "nvim-telescope/telescope.nvim", tag = "0.1.3" },

	-- Optional Telescope dependencies
	-- "nvim-telescope/telescope-fzf-native.nvim", { "do": "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build" }
	"sharkdp/fd",
	{ "nvim-treesitter/nvim-treesitter", build =  "TSUpdate" },
	"nvim-tree/nvim-web-devicons",

	-- for some reason ack doesn't work
	-- https://github.com/mileszs/ack.vim/issues/156
	"mileszs/ack.vim",

	-- Kills a buffer without closing a split, use ,w
	"moll/vim-bbye",

	-- Smarts around killing buffers, will close the split if it"s the last buffer in
	-- it, and close vim if it"s the last buffer/split. Use ,w
	"aaronjensen/vim-command-w",

	-- Automatically add end at the end of ruby and vim blocks
	"tpope/vim-endwise",

	-- Handy file manipulations. Favorites are :Remove and :Rename
	"tpope/vim-eunuch",

	"navarasu/onedark.nvim",

	-- makes the command line and insert mode behave like emacs
	"tpope/vim-rsi",

	-- Adds gr command to replace text (takes a motion)
	-- similar to v(motion)p but also cuts text into black hole register so it is
	-- repeatable. So really it"s similar to v(motion)"_p
	"inkarkat/vim-ReplaceWithRegister",

	-- Add FocusGained/FocusLost back in tmux
	"sjl/vitality.vim",


	-- netrw fixes to make it better. Press - in normal mode.
	-- Use ,w to get back.
	-- Use cd to change your vim current directory.
	-- Use - to go up a directory.
	"tpope/vim-vinegar",

	-- Move parameters around with ,< and ,>
	"AndrewRadev/sideways.vim",

	-- Align things with :Tab /whatever
	"godlygeek/tabular",

	-- Seamless tmux / vim split navigation
	"christoomey/vim-tmux-navigator",

	-- Fuzzy finder
	"junegunn/fzf.vim",

	-- Multi cursor editing
	"mg979/vim-visual-multi",

	-- LSP completion, linting, formatting and more
	{ "neoclide/coc.nvim",  branch = "release" },
}
