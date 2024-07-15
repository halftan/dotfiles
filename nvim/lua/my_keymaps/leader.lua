local wk = require('which-key')

wk.add({
  {'<leader>', group = 'Leader'},
  {
    mode = 'n',
    {'<leader>p', '"+p', desc = 'Paste from system clipboard'},
    {'<leader>P', '"+P', desc = 'Paste from system clipboard'},
    {'<leader>q', function() MiniBufremove.delete(0) end, desc = 'Close buffer'},
    {'<leader>y', '"+y', desc = 'Yank to system clipboard'},
    {'<leader>Y', '"+Y', desc = 'Yank to system clipboard'},
    {'<leader><space>', MiniTrailspace.trim, desc = 'Delete trailing spaces'},
  },
  {
    mode = 'x',
    {'<leader>y', '"+y', desc = 'Yank to system clipboard'},
    {'<leader>Y', '"+Y', desc = 'Yank to system clipboard'},
    {'<leader>p', '"+p', desc = 'Paste from system clipboard'},
    {'<leader>P', '"+P', desc = 'Paste from system clipboard'},
  }
})

return {}
