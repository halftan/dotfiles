local wk = require('which-key')
local utils = require('my_utils')

wk.register({
  ['b'] = {
    name = 'Buffer',
    ['1'] = {'<cmd>BufferGoto 1<cr>', 'Goto buffer 1'},
    ['2'] = {'<cmd>BufferGoto 2<cr>', 'Goto buffer 2'},
    ['3'] = {'<cmd>BufferGoto 3<cr>', 'Goto buffer 3'},
    ['4'] = {'<cmd>BufferGoto 4<cr>', 'Goto buffer 4'},
    ['5'] = {'<cmd>BufferGoto 5<cr>', 'Goto buffer 5'},
    ['6'] = {'<cmd>BufferGoto 6<cr>', 'Goto buffer 6'},
    ['7'] = {'<cmd>BufferGoto 7<cr>', 'Goto buffer 7'},
    ['8'] = {'<cmd>BufferGoto 8<cr>', 'Goto buffer 8'},
    ['9'] = {'<cmd>BufferGoto 9<cr>', 'Goto buffer 9'},
    ['0'] = {'<cmd>BufferLast<cr>', 'Goto last buffer'},
    ['b'] = {'<cmd>BufferPick<cr>', 'Pick buffer'},
    ['d'] = {'<cmd>BufferClose<cr>', 'Unload buffer'},
    ['o'] = {'<cmd>BufferCloseAllButCurrentOrPinned<cr>', 'Close other buffers'},
    ['O'] = {'<cmd>BufferCloseAllButCurrent<cr>', 'Close other buffers (including pinned)'},
    ['D'] = {'<cmd>BufferClose!<cr>', 'Force unload buffer'},
    ['p'] = {'<cmd>BufferPin<cr>', 'Pin current buffer'},
    ['/'] = {'<cmd>Telescope current_buffer_fuzzy_find<cr>', 'Search in buffer'},

    ['n'] = {'<cmd>enew<cr>', 'Create buffer'},
  },
}, { prefix = '<space>' })

return {}
