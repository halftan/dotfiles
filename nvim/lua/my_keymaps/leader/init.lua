local wk = require('which-key')

wk.register({
  ['p'] = {'"+p', 'Paste from system clipboard'},
  ['P'] = {'"+P', 'Paste from system clipboard'},
  ['q'] = {function() MiniBufremove.delete(0) end, 'Close buffer'},
  ['y'] = {'"+y', 'Yank to system clipboard'},
  ['Y'] = {'"+Y', 'Yank to system clipboard'},
  -- ['<space>'] = {':<C-u>silent! keeppatterns %substitute/\\s\\+$//e<cr>', 'Delete trailing spaces'},
  ['<space>'] = {MiniTrailspace.trim, 'Delete trailing spaces'},
}, {prefix = '<leader>'})

wk.register({
  ['y'] = {'"+y', 'Yank to system clipboard'},
  ['Y'] = {'"+Y', 'Yank to system clipboard'},
  ['p'] = {'"+p', 'Paste from system clipboard'},
  ['P'] = {'"+P', 'Paste from system clipboard'},
}, {prefix = '<leader>', mode = 'x'})

return {}
