local M = {}
M.setup = function()
  require('bufferline').setup {
    icons = 'both',
    icon_pinned = '車',
  }

  -- for nvim-tree
  local nvim_tree_events = require('nvim-tree.events')
  local bufferline_state = require('bufferline.state')

  local function get_tree_size()
    return require'nvim-tree.view'.View.width
  end

  nvim_tree_events.subscribe('TreeOpen', function()
    bufferline_state.set_offset(get_tree_size())
  end)

  nvim_tree_events.subscribe('Resize', function()
    bufferline_state.set_offset(get_tree_size())
  end)

  nvim_tree_events.subscribe('TreeClose', function()
    bufferline_state.set_offset(0)
  end)
end
return M
