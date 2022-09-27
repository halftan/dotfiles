local wk = require('which-key')
local utils = require('my_utils')

wk.register({
  ['h'] = {
    name = 'Help',
    ['/'] = { '<cmd>Telescope help_tags<cr>', 'Search for help' },
  },
}, { prefix = '<space>' })

return {}
