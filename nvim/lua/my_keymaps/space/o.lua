local wk = require('which-key')
local utils = require('my_utils')

wk.register({
  ['o'] = {
    name = 'Open/Other',
    ['p'] = {function() require'nvim-tree.api'.tree.toggle(true, true) end, 'Open nvim-tree'},
    ['P'] = {function()
      local nta = require('nvim-tree.api')
      nta.tree.find_file(vim.fn.expand('%:p'))
      nta.tree.focus()
    end, 'Find current file in nvim-tree'},
    -- ['q'] = {function() require'nvim-tree.api'.tree.close() end, 'Open nvim-tree'},
    ['g'] = {
      name = 'Git/GitHub',
      ['f'] = {'<cmd>GitBlameOpenFileURL<cr>', ' Open file URL'},
      ['c'] = {'<cmd>GitBlameOpenCommitURL<cr>', ' Open commit URL'},
    },
  },
}, { prefix = '<space>' })

return {}
