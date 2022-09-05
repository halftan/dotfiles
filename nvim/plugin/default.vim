if exists('s:loaded_default')
  finish
endif
let s:loaded_default = 1

if maparg('<c-g>', 'n') == ''
  nnoremap <silent> <c-g> :<c-u>call ctrlg#display()<cr>
endif

nnoremap <expr> <Leader>p "+p

" Start new line
inoremap <S-Return> <C-o>o

" Paste and indent
nnoremap =p p'[v']=

" Improve scroll, credits: https://github.com/Shougo
nnoremap <expr> zz (winline() == (winheight(0)+1) / 2) ?
      \ 'zt' : (winline() == &scrolloff + 1) ? 'zb' : 'zz'

" Select blocks after indenting
xnoremap < <gv
xnoremap > >gv|

" Use tab for indenting in visual mode
xnoremap <Tab> >gv|
xnoremap <S-Tab> <gv
nnoremap > >>_
nnoremap < <<_

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
