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
    },
  }, {
      prefix = '<space>',
      buffer = bufnr,
    })
end

return M
