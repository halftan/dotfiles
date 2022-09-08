local wk = require('which-key')

wk.register({
  ['p'] = {'"+p', 'Paste from system clipboard'},
  ['P'] = {'"+P', 'Paste from system clipboard'},
  ['y'] = {'"+y', 'Yank to system clipboard'},
  ['Y'] = {'"+Y', 'Yank to system clipboard'},
}, {prefix = '<leader>'})

wk.register({
  ['y'] = {'"+y', 'Yank to system clipboard', mode = 'x'},
  ['Y'] = {'"+Y', 'Yank to system clipboard', mode = 'x'},
}, {prefix = '<leader>'})
