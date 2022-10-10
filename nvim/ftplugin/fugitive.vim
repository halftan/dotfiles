if exists("b:plugin_loaded")
  finish
endif

let b:plugin_loaded = 1

lua <<EOT
require('nvim-surround').buffer_setup {
  keymaps = {
    insert = false,
    insert_line = false,
    normal = false,
    normal_cur = false,
    normal_line = false,
    normal_cur_line = false,
    visual = false,
    visual_line = false,
    delete = false,
    change = false,
  }
}
EOT

nmap <buffer> q gq
