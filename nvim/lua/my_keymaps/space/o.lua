local wk = require('which-key')
local utils = require('my_utils')

wk.register({
  ['o'] = {
    name = 'Other',
    ['p'] = {function() require'nvim-tree.api'.tree.toggle(true, true) end, 'Open nvim-tree'},
    ['P'] = {function()
      local nta = require('nvim-tree.api')
      nta.tree.find_file(vim.fn.expand('%:p'))
      nta.tree.focus()
    end, 'Find current file in nvim-tree'},
    -- ['q'] = {function() require'nvim-tree.api'.tree.close() end, 'Open nvim-tree'},
  },
}, { prefix = '<space>' })

return {}
