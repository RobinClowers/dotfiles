-- Smart pane switching (port of vim-tmux-navigator): C-h/j/k/l moves between rex
-- panes, unless the focused pane is running vim/nvim -- then the raw key is sent
-- through and the editor moves its own splits. The nvim side (in the dotfiles'
-- nvim/lua/rex-navigation.lua) delegates back to rex when it has no split that
-- way, so navigation is seamless across both layers.
local VIM_PROGRAMS = {
  vim = true, nvim = true, gvim = true,
  view = true, gview = true,
  vimdiff = true, nvimdiff = true,
}

local function basename(s)
  if type(s) ~= "string" or s == "" then return nil end
  return (s:match("[^/]+$") or s):gsub("^%-", "")
end

local function is_vim(fg)
  if fg == nil then return false end
  return VIM_PROGRAMS[basename(fg.script)] == true
      or VIM_PROGRAMS[basename(fg.argv0)] == true
      or VIM_PROGRAMS[basename(fg.name)] == true
      or VIM_PROGRAMS[basename(fg.path)] == true
end

rex.action{
  name  = "smart_focus",
  title = "Focus Pane (Vim-Aware)",
  args  = { direction = "string", key = "string" },
  run   = function(ctx, args)
    local proc = rex.block.call("com.superlogical.terminal", "process",
      { block_id = ctx.block_id })
    if is_vim(proc and proc.foreground) then
      rex.client.queue("pane.send_key", { key = args.key })
    else
      rex.session.focus_direction{ direction = args.direction }
    end
  end,
}

rex.bind("ctrl+h", "smart_focus", { direction = "left", key = "ctrl+h" })
rex.bind("ctrl+j", "smart_focus", { direction = "down", key = "ctrl+j" })
rex.bind("ctrl+k", "smart_focus", { direction = "up", key = "ctrl+k" })
rex.bind("ctrl+l", "smart_focus", { direction = "right", key = "ctrl+l" })
