local wk = require('which-key')
local utils = require('my_utils')

wk.register({
  ['b'] = {
    name = 'Buffer',
    ['1'] = {'<cmd>BufferLineGoToBuffer 1<cr>', 'Goto buffer 1'},
    ['2'] = {'<cmd>BufferLineGoToBuffer 2<cr>', 'Goto buffer 2'},
    ['3'] = {'<cmd>BufferLineGoToBuffer 3<cr>', 'Goto buffer 3'},
    ['4'] = {'<cmd>BufferLineGoToBuffer 4<cr>', 'Goto buffer 4'},
    ['5'] = {'<cmd>BufferLineGoToBuffer 5<cr>', 'Goto buffer 5'},
    ['6'] = {'<cmd>BufferLineGoToBuffer 6<cr>', 'Goto buffer 6'},
    ['7'] = {'<cmd>BufferLineGoToBuffer 7<cr>', 'Goto buffer 7'},
    ['8'] = {'<cmd>BufferLineGoToBuffer 8<cr>', 'Goto buffer 8'},
    ['9'] = {'<cmd>BufferLineGoToBuffer 9<cr>', 'Goto buffer 9'},
    ['0'] = {'<cmd>BufferLineGoToBuffer -1<cr>', 'Goto last buffer'},
    ['b'] = {'<cmd>BufferLinePick<cr>', 'Pick buffer'},
    ['d'] = {function() MiniBufremove.delete(0) end, 'Unload buffer'},
    ['o'] = {function() local close = require'bufferline'.close_in_direction; close('left'); close('right') end, 'Close other buffers'},
    ['O'] = {'<cmd>BufferLineCloseLeft<cr>|<cmd>BufferLineCloseRight<cr>', 'Close other buffers (including pinned)'},
    ['u'] = {function() require'bufferline'.close_in_direction('left') end, 'Close buffers to left'},
    ['k'] = {function() require'bufferline'.close_in_direction('right') end, 'Close buffers to right'},
    ['D'] = {function() MiniBufremove.delete(0) end, 'Force unload buffer'},
    ['p'] = {'<cmd>BufferLineTogglePin<cr>', 'Pin current buffer'},
    ['/'] = {'<cmd>Telescope current_buffer_fuzzy_find<cr>', 'Search in buffer'},

    ['n'] = {'<cmd>enew<cr>', 'Create buffer'},
  },
}, { prefix = '<space>' })

return {}
