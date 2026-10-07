-- nvim-treesitter `main` branch: parsers are installed here, highlighting is
-- enabled per-buffer via vim.treesitter.start(). Requires the tree-sitter CLI.
local ts = require("nvim-treesitter")

ts.install({ "ruby", "lua", "vim", "vimdoc", "javascript", "typescript", "tsx", "css", "rust" })

local max_filesize = 100 * 1024 -- 100 KB

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local buf = args.buf
    local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
    if ok and stats and stats.size > max_filesize then
      return
    end

    local lang = vim.treesitter.language.get_lang(args.match)
    if not lang then
      return
    end

    -- Emulate the old `auto_install`: install missing parsers on demand.
    if not vim.tbl_contains(ts.get_installed(), lang) then
      if vim.tbl_contains(ts.get_available(), lang) then
        ts.install(lang):await(function()
          if vim.api.nvim_buf_is_valid(buf) then
            pcall(vim.treesitter.start, buf, lang)
          end
        end)
      end
      return
    end

    pcall(vim.treesitter.start, buf, lang)
  end,
})
