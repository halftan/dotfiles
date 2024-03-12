local wk = require('which-key')
local utils = require('my_utils')

wk.register({
  ['y'] = {
    name = 'Yank',
    ['g'] = {
      name = 'Git/GitHub',
      ['f'] = {'<cmd>GitBlameCopyFileURL<cr>', ' Copy file URL'},
      ['c'] = {'<cmd>GitBlameCopyCommitURL<cr>', ' Copy commit URL'},
      ['h'] = {'<cmd>GitBlameCopySHA<cr>', ' Copy commit SHA'},
    },
    ['.'] = {function() vim.fn.setreg('+', vim.fn.expand('%')) end, "Copy current buffer's relative path"},
    ['>'] = {function() vim.fn.setreg('+', vim.fn.expand('%:p')) end, "Copy current buffer's absolute path"},
    ['c'] = {function() vim.fn.setreg('+', vim.fn.getcwd()) end, 'Copy cwd'},
  },
}, { prefix = '<space>' })

return {}
