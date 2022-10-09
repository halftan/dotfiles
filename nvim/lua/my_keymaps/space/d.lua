local wk = require('which-key')
local utils = require('my_utils')

wk.register({
  ['_'] = {
    name = 'Example keymaps',
    ['e'] = {"<cmd>echo '___'<cr>", 'Example keymap for _'}
  }
}, { prefix = '<space>' })

local M = {}

function M.local_keymaps(client, bufnr)
  wk.register({
    ['d'] = {
      name = 'Diagnostics',
      ['h'] = {function() vim.diagnostic.hide(nil, bufnr) end, 'Hide diagnostics'},
      ['s'] = {function() vim.diagnostic.show(nil, bufnr) end, 'Show diagnostics'},
      ['D'] = {function() vim.diagnostic.disable(bufnr) end, 'Disable diagnostics'},
      ['S'] = {function() vim.diagnostic.enable(bufnr) end, 'Enable diagnostics'},
      ['d'] = {"<cmd>Trouble document_diagnostics<cr>", 'Show diagnostics in Trouble'},
      ['w'] = {"<cmd>Trouble workspace_diagnostics<cr>", 'Show workspace diagnostics in Trouble'},
    },
  }, {
      prefix = '<space>',
      buffer = bufnr,
    })
end

return M
