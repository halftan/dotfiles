local M = {}

M.setup = function(client, bufnr)
  local wk = require('which-key')
  wk.register({
    [','] = {
      name = 'LSP/Main',
      ['`'] = {'<cmd>GoAlternate<cr>', 'Jump between Go source code and corresponding test file'},
      ['t'] = {
        name = 'Go test',
        ['t'] = {'<cmd>GoTest!<cr>', 'GoTest current directory'},
        ['f'] = {'<cmd>GoTestFunc!<cr>', 'GoTest current function'},
        ['c'] = {'<cmd>GoTestFile!<cr>', 'GoTest current file'},
        ['a'] = {'<cmd>GoTest! ./...<cr>', 'GoTest current project'},
        -- ['f'] = {'<cmd><cr>'}
      },
      ['d'] = {
        name = 'Doc',
        ['d'] = {'<cmd>GoDoc<cr>', 'Show godoc for the symbol under cursor'},
        ['o'] = {'<cmd>GoDoc<cr>', 'Show godoc in browser for the symbol under cursor'},
      }
    },
  })
end

return M
