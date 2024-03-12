local wk = require('which-key')
local utils = require('my_utils')

local function toggle_conceal()
  local current_conceallevel = vim.api.nvim_get_option_value('conceallevel', {scope = 'local'})
  if current_conceallevel == 1 then current_conceallevel = 2 end
  vim.api.nvim_set_option_value('conceallevel', 2 - current_conceallevel, {scope = 'local'})
end

wk.register({
  ['t'] = {
    name = 'Toggles',
    ['b'] = {'<cmd>GitBlameToggle<cr>', 'Toggle git blame'},
    ['i'] = {'<cmd>IndentLinesToggle<cr>', 'Toggle indent guide'},
    ['u'] = {'<cmd>UndotreeToggle<cr>', 'Toggle Undotree'},
    ['T'] = {'<cmd>TableModeToggle<cr>', 'Toggle table mode'},
    ['c'] = {toggle_conceal, 'Toggle conceal'},
  },
}, { prefix = '<space>' })

return {}
