local wk = require('which-key')
local utils = require('my_utils')

wk.register({
  ['w'] = {
    name = 'Window',
    ['l'] = {'<cmd>wincmd l<cr>', 'Left'},
    ['h'] = {'<cmd>wincmd h<cr>', 'Right'},
    ['j'] = {'<cmd>wincmd j<cr>', 'Down'},
    ['k'] = {'<cmd>wincmd k<cr>', 'Up'},
    ['L'] = {'<cmd>wincmd L<cr>', 'Move window to leftmost'},
    ['H'] = {'<cmd>wincmd H<cr>', 'Move window to rightmost'},
    ['J'] = {'<cmd>wincmd J<cr>', 'Move window to bottom'},
    ['K'] = {'<cmd>wincmd K<cr>', 'Move window to top'},
    ['`'] = {'<cmd>wincmd p<cr>', 'Focus previous window'},
    ['p'] = {'<cmd>wincmd P<cr>', 'Focus preview window'},
    ['P'] = {'<cmd>wincmd z<cr>', 'Focus preview window'},
    ['/'] = {'<cmd>vs<cr>', 'Split vertically'},
    ['s'] = {'<cmd>sp<cr>', 'Split horizontally'},
    ['f'] = {'<cmd>NvimTreeFocus<cr>', 'Focus nvim-tree'},
    ['d'] = {'<cmd>close<cr>', 'Close window'},
    ['D'] = {'<cmd>close!<cr>', 'Close window'},
    ['='] = {'<cmd>wincmd =<cr>', 'Balance hiehgt and width'},
    ['n'] = {'<cmd>new<cr>', 'Create window'},
  },
}, { prefix = '<space>' })

return {}
