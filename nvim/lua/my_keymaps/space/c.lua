local wk = require('which-key')
local utils = require('my_utils')

wk.register({
  ['c'] = {
    name = 'Code',
    ['r'] = {
      name = 'Run',
      ['f'] = {'<cmd>SnipRun<cr>', 'Run file'},
    },
  },
}, { prefix = '<space>' })

return {}
