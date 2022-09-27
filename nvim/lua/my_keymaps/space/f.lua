local wk = require('which-key')
local utils = require('my_utils')

wk.register({
  ['f'] = {
    name = 'File & Fuzzy',
    ['`'] = {'<cmd>Telescope resume<cr>', 'Resume last find'},
    ['"'] = {'<cmd>Telescope registers<cr>', 'Find registers'},
    ['/'] = {'<cmd>Telescope builtin include_extensions=true __hide_previewer=true<cr>', 'Telescope extensions'},
    ['f'] = {'<cmd>Telescope find_files<cr>', 'Find files'},
    ['F'] = {'<cmd>Telescope find_files hidden=true<cr>', 'Find hidden files'},
    ['t'] = {'<cmd>Telescope tags<cr>', 'Find tags'},
    ['c'] = {'<cmd>Telescope colorscheme __hide_previewer=true<cr>', 'Find colorscheme'},
    ['s'] = {'<cmd>w<cr>', 'Save file'},
    ['S'] = {'<cmd>SudaWrite<cr>', 'Sudo save file'},
    ['p'] = {'<cmd>Telescope packer __hide_previewer=true<cr>', 'Find packages'},
    ['o'] = {'<cmd>NvimTreeFindFile<cr>', 'Find current buffer in nvim-tree'},
    ['y'] = {function() vim.fn.setreg('+', vim.fn.expand('%')) end, "Copy current buffer's relative path"},
    ['Y'] = {function() vim.fn.setreg('+', vim.fn.expand('%:p')) end, "Copy current buffer's absolute path"},
  },
}, { prefix = '<space>' })

return {}
