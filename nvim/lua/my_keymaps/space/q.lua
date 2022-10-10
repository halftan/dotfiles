local wk = require('which-key')
local utils = require('my_utils')

wk.register({
  ['q'] = {
    name = 'Quit',
    ['q'] = {'<cmd>qall<cr>', 'Quit'},
    ['Q'] = {'<cmd>qall!<cr>', 'Force quit'},
  },
}, { prefix = '<space>' })

return {}
