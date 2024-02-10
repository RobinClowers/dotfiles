vim.opt.runtimepath:prepend(vim.fn.expand("~/.vim"))
vim.opt.runtimepath:append(vim.fn.expand("~/.vim/after"))
vim.cmd('source ~/.vimrc')

require'nvim-treesitter.configs'.setup {
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = { "ruby", "lua", "vim", "vimdoc", "javascript", "typescript", "tsx", "css", "rust" },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	highlight = {
		enable = true,
		-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
		disable = function(lang, buf)
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
}

require('onedark').setup  {
	-- Main options --
	style = 'darker', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'

	-- Custom Highlights --
	colors = {
		bg0 = "#1C1D1B",
	}, -- Override default colors

	highlights = {
		["@keyword"] = {fg = '$red'},
		["@keyword.conditional"] = {fg = '$purple'},
		["@keyword.directive"] = {fg = '$red'},
		["@keyword.import"] = {fg = '$red'},
		["@string"] = {fg = '$yellow'},
		["@string.escape"] = {fg = '$grey'},
		["@string.special"] = {fg = '$grey'},
		["@tag"] = {fg = '$green' },
		["@tag.attribute"] = {fg = '$blue'},
		["@tag.delimiter"] =  {fg = '$grey' },
		["@type"] = {fg = '$green'},
		["@variable.parameter"] = {fg = '$cyan'},
	}, -- Override highlight groups
}


require('onedark').load()
