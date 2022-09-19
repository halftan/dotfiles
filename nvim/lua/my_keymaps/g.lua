local wk = require('which-key')

wk.register({
  ['r'] = {
    name = 'Refactor',
    ['r'] = {'Rename'}
  }
}, { prefix = 'g' })
