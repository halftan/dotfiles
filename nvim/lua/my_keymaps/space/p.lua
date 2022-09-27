local wk = require('which-key')
local utils = require('my_utils')

wk.register({
  ['p'] = {
    name = 'Project',
    ['f'] = {'<cmd>Telescope git_files show_untracked=true<cr>', 'Find project files'},
    ['p'] = {'<cmd>Telescope projects<cr>', 'Find and switch project'},
  },
}, { prefix = '<space>' })

return {}
