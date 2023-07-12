local wk = require('which-key')
local utils = require('my_utils')

wk.register({
  ['<space>'] = {
    name = 'Hop',
    ['j'] = {'<cmd>HopVerticalAC<cr>', 'Line below'},
    ['k'] = {'<cmd>HopVerticalBC<cr>', 'Line above'},
    ['/'] = {'<cmd>HopChar2<cr>', '2 char jump'},
    ['f'] = {'<cmd>HopChar1AC<cr>', '1 char forward'},
    ['F'] = {'<cmd>HopChar1BC<cr>', '1 char backward'},
    ['w'] = {'<cmd>HopWordAC<cr>', 'Word jump forward'},
    ['b'] = {'<cmd>HopWordBC<cr>', 'Word jump backward'},
  },
}, { prefix = '<space>' })

return {}
