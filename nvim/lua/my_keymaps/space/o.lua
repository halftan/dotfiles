local wk = require('which-key')
local utils = require('my_utils')

wk.register({
  ['o'] = {
    name = 'Other',
    ['p'] = {function() require'nvim-tree'.focus() end, 'Open nvim-tree'},
    ['P'] = {function() require'nvim-tree'.find_file(vim.fn.expand('%:p')) end, 'Find current file in nvim-tree'},
  },
}, { prefix = '<space>' })

return {}
