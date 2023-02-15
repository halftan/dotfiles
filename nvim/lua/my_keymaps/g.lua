local wk = require('which-key')

wk.register({
  ['r'] = {
    name = 'Refactor',
    ['r'] = {'Rename'}
  },
  ['a'] = {'<Plug>(EasyAlign)', 'EasyAlign'},
  ['='] = {function() vim.lsp.buf.format() end, 'Format buffer'},
}, { prefix = 'g' })
