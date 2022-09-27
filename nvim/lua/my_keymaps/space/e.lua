local wk = require('which-key')
local utils = require('my_utils')

wk.register({
  ['e'] = {
    name = 'Edit/Eval',
    ['e'] = {"<cmd>'<,'>SnipRun<cr>", "SnipRun selected"}
  },
}, { prefix = '<space>', mode = 'x' })

return {}
