local wk = require('which-key')

wk.register({
  ['p'] = {'"+p', 'Paste from system clipboard'},
  ['P'] = {'"+P', 'Paste from system clipboard'},
  ['y'] = {'"+y', 'Yank to system clipboard'},
  ['Y'] = {'"+Y', 'Yank to system clipboard'},
  ['w'] = {function()
    local picked_window_id = require('window-picker').pick_window() or vim.api.nvim_get_current_win()
    vim.api.nvim_set_current_win(picked_window_id)
  end, 'Pick a window'}
}, {prefix = '<leader>'})

wk.register({
  ['y'] = {'"+y', 'Yank to system clipboard', mode = 'x'},
  ['Y'] = {'"+Y', 'Yank to system clipboard', mode = 'x'},
}, {prefix = '<leader>'})
