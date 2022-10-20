local wk = require('which-key')
local utils = require('my_utils')

wk.register({
  ['s'] = {
    name = 'Search & Syntax',
    ['/'] = {'<cmd>Telescope live_grep_args<cr>', 'Search in project'},
    ['P'] = {'<cmd>Telescope grep_string<cr>', 'Search word under cursor'},
    ['s'] = {'<cmd>Telescope lsp_document_symbols<cr>', 'Search symbols in buffer'},
    ['S'] = {'<cmd>Telescope lsp_dynamic_workspace_symbols<cr>', 'Search symbols in project'},
    ['r'] = {'<cmd>Telescope lsp_references<cr>', 'Search references'},
    ['d'] = {'<cmd>Telescope lsp_definitions<cr>', 'Search definitions'},
    ['i'] = {'<cmd>Telescope lsp_implementations<cr>', 'Search definitions'},
  },
}, { prefix = '<space>' })

return {}
