local wk = require('which-key')

wk.register({
  ['r'] = {
    name = 'Refactor',
    ['r'] = {'Rename'}
  },
  ['a'] = {'<Plug>(EasyAlign)', 'EasyAlign'},
}, { prefix = 'g' })
