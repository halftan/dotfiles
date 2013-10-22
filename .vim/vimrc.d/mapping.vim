let mapleader = "\<space>"

" Template
" nmap <Leader>

" Write with sudo
cmap w!! w !sudo tee > /dev/null %

"  editor's command
imap jj <ESC>l
nmap <Leader>w :w<cr>
nmap <Leader>ev :tabe $MYVIMRC<cr>
nmap <Leader>sv :so $MYVIMRC<cr>

nmap <Leader>/ :nohlsearch<cr>


" NERDTree shortcuts
nmap <Leader>nt :NERDTreeToggle<CR>

" Vundle
nmap <Leader>bi :NeoBundleInstall<cr>
nmap <Leader>bu :NeoBundleInstall!<cr>

nmap <Leader>gs :Gstatus<cr>

" Toggle relative numbers
nmap <Leader>nr :NumbersToggle<cr>

" Run specs
nmap <Leader>rc :call RunCurrentSpecFile()<cr>
nmap <Leader>rn :call RunNearestSpec()<cr>
nmap <Leader>rl :call RunLastSpec()<cr>
nmap <Leader>ra :call RunAllSpecs()<cr>

"  Unite
nmap <Leader>uf :Unite file<cr>
nmap <Leader>ub :Unite buffer<cr>
nmap <Leader>ur :Unite file_rec<cr>
let g:unite_source_history_yank_enable = 1
nmap <Leader>uy :Unite history/yank<cr>
nmap <Leader>u/ :Unite grep:.<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  c-a and c-e key binding in insert mode like emacs  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap <c-a> <Home>
cmap <c-a> <Home>
imap <c-e> <End>
cmap <c-e> <End>

""""""""""""""""""""""""
"  Disable arrow keys  "
""""""""""""""""""""""""
map <Left>  <Nop>
map <Right> <Nop>
map <Up>    <Nop>
map <Down>  <Nop>

nmap <Leader>gc :call CompileCode()<CR>
nmap <Leader>gr :call RunCode()<CR>
nmap <Leader>cc :call CompileCodeClang()<CR>
nmap <Leader>gr :call RunCode()<CR>
