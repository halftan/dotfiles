local wk = require('which-key')
local utils = require('my_utils')

wk.register({
  ['g'] = {
    name = 'Git',
    ['s'] = {'<cmd>Git<cr>', 'Git status'},
    ['o'] = {'<cmd>GBrowse<cr>', 'Open in browser'},
  },
}, { prefix = '<space>' })

return {}