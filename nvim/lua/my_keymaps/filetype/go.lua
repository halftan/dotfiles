local M = {}

M.setup = function(client, bufnr)
  local wk = require('which-key')
  wk.add({
    {
      mode = 'n',
      buffer = bufnr,
      {',', group = 'LSP/Main'},
      {',t', group = 'Go test'},
      {',d', group = 'Doc'},
      {',`', '<cmd>GoAlternate<cr>', desc = 'Jump between Go source code and corresponding test file'},
      {',tt', '<cmd>GoTest!<cr>', desc = 'GoTest current directory'},
      {',tf', '<cmd>GoTestFunc!<cr>', desc = 'GoTest current function'},
      {',tc', '<cmd>GoTestFile!<cr>', desc = 'GoTest current file'},
      {',ta', '<cmd>GoTest! ./...<cr>', desc = 'GoTest current project'},
      -- {',tf', '<cmd><cr>'}
      {',dd', '<cmd>GoDoc<cr>', desc = 'Show godoc for the symbol under cursor'},
      {',do', '<cmd>GoDoc<cr>', desc = 'Show godoc in browser for the symbol under cursor'},
      {',cr', '<cmd>GoRun<cr>', desc = 'GoRun current file'},
    },
    {
      mode = 'i',
      buffer = bufnr,
      {'<F3>', 'if err != nil {<C-o>o}<C-o>O'}
    }
  })
end

return M
