if exists("b:plugin_loaded")
  finish
endif

let b:plugin_loaded = 1

lua <<EOT
local ft = require('Comment.ft')
ft.set('brewfile', '#%s')
EOT
