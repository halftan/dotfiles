
vim.cmd [[
let g:airline_powerline_fonts=1
" let g:airline#extensions#ale#enabled = 0
let g:airline#extensions#fugitiveline#enabled=1
call airline#add_statusline_func('default#add_winnr_statusline')
call airline#add_inactive_statusline_func('default#add_winnr_statusline')
let g:airline_theme='onedark'
]]
-- call airline#parts#define('winnr', { 'raw': '%{winnr()-1}', 'accent': 'none'})
-- let w:airline_section_a = airline#section#create_left(['winnr', 'mode', 'crypt', 'paste', 'keymap', 'spell', 'capslock', 'xkblayout', 'iminsert'])
