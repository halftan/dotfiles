if exists('s:loaded_default')
  finish
endif
let s:loaded_default = 1

if maparg('<c-g>', 'n') == ''
  nnoremap <silent> <c-g> :<c-u>call ctrlg#display()<cr>
endif

" nnoremap <Leader>p "+p
" nnoremap <Leader>P "+P
" nnoremap <Leader>y "+y
" xnoremap <Leader>y "+y
" nnoremap <Leader>Y "+Y
" xnoremap <Leader>Y "+Y

" Start new line
inoremap <S-Return> <C-o>o

" Improve scroll, credits: https://github.com/Shougo
nnoremap <expr> zz (winline() == (winheight(0)+1) / 2) ?
      \ 'zt' : (winline() == &scrolloff + 1) ? 'zb' : 'zz'

" Select blocks after indenting
xnoremap < <gv
xnoremap > >gv|

" Use tab for indenting in visual mode
xnoremap <Tab> >gv|
xnoremap <S-Tab> <gv
" nnoremap > >>_
" nnoremap < <<_

" smart up and down
nnoremap <silent><Down> gj
nnoremap <silent><Up> gk

" Remove spaces at the end of lines
nnoremap <silent> ,<Space> :<C-u>silent! keeppatterns %substitute/\s\+$//e<CR>

" Navigation
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-e> <End>
inoremap <C-f> <Right>
inoremap <C-a> <Home>
inoremap <C-b> <Left>
inoremap <C-e> <End>
" @bug_vim with <silent> command line can not be cleared
cnoremap <expr> <C-k> repeat('<Delete>', strchars(getcmdline()) - getcmdpos() + 1)

let s:winnr_labels = {
      \ 1: '[1]', 2: '[2]', 3: '[3]', 4: '[4]',
      \ 5: '[5]', 6: '[6]', 7: '[7]', 8: '[8]',
      \ 9: '[9]', 0: '[0]', 10: '[10]',
      \ }

function! default#get_current_winnr()
  let l:nr = tabpagewinnr(tabpagenr())
  if getwinvar(1, '&ft') == 'NvimTree'
    let l:nr = l:nr - 1
  endif
  return get(s:winnr_labels, l:nr, '['.l:nr.']')
endfunction

function! default#add_winnr_statusline(...)
  let builder = a:1
  let context = a:2
  call builder.add_section_spaced('airline_b', '%{default#get_current_winnr()}')
  if getbufvar(context.bufnr, '&ft') == 'NvimTree'
    if context.active
      call builder.add_section_spaced('airline_a', 'NvimTree')
    else
      call builder.add_section_spaced('airline_c', 'NvimTree')
    endif
    call builder.add_section('airline_b', '')
    return 1
  endif
  return 0
endfunction
