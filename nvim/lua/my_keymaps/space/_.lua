local wk = require('which-key')
local utils = require('my_utils')

wk.register({
  ['_'] = {
    name = 'Example keymaps',
    ['e'] = {'<cmd>echo ___<cr>', 'Example keymap for _'}
  }
}, { prefix = '<space>' })

return {}
