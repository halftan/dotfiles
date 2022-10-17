if exists("b:plugin_loaded")
  finish
endif

let b:plugin_loaded = 1

nmap <buffer> q <cmd>wincmd q<cr>
