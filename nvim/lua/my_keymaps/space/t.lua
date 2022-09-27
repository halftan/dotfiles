local wk = require('which-key')
local utils = require('my_utils')

wk.register({
  ['t'] = {
    name = 'Toggles',
    ['i'] = {'<cmd>IndentLinesToggle<cr>', 'Toggle indent guide'},
    ['u'] = {'<cmd>UndotreeToggle<cr>', 'Toggle Undotree'},
    ['T'] = {'<cmd>TableModeToggle<cr>', 'Toggle table mode'},
  },
}, { prefix = '<space>' })

return {}
