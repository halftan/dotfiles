
vim.cmd [[
let g:airline_powerline_fonts=1
" let g:airline#extensions#ale#enabled = 0
let g:airline#extensions#fugitiveline#enabled=1
call airline#add_statusline_func('default#add_winnr_statusline')
call airline#add_inactive_statusline_func('default#add_winnr_statusline')
let g:airline_theme='onedark'
]]
vim.fn['airline#parts#define_raw']('breadcrumb', "%{%v:lua.require'nvim-navic'.get_location()%}")

if vim.fn.exists("+autochdir") and vim.o.autochdir then
  vim.g.airline_section_c = vim.fn['airline#section#create_left']({'path', 'breadcrumb'})
else
  vim.g.airline_section_c = vim.fn['airline#section#create_left']({'file', 'breadcrumb'})
end
-- call airline#parts#define('breadcrumb', { 'raw': '%{winnr()-1}', 'accent': 'none'})
-- let w:airline_section_a = airline#section#create_left(['winnr', 'mode', 'crypt', 'paste', 'keymap', 'spell', 'capslock', 'xkblayout', 'iminsert'])
