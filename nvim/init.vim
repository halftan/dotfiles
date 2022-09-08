let mapleader='\'
let g:python3_host_prog=expand("$HOME/.pyenv/versions/3.10.2/bin/python")

if &shell =~# 'fish$' && (v:version < 704 || v:version == 704 && !has('patch276'))
  set shell=/usr/bin/env\ bash
endif

" Load packer.nvim
lua <<EOF
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
  end

  return require('packer').startup(function(use)
    require('my_plugins').setup(use)
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
      require('packer').sync()
    end
  end)
EOF

set mouse=nv
set termguicolors
set background=dark
colorscheme onedark
set virtualedit=block,onemore " Allow for cursor beyond last character
set updatetime=200
set undofile
set undolevels=1000
set hidden
set number relativenumber
set ignorecase smartcase
set timeoutlen=500
set sessionoptions=buffers,curdir,folds,help,tabpages,winsize
set ttimeout
set ttimeoutlen=100
set smarttab
set modeline
set list " Show these tabs and spaces and so on
set listchars=tab:▸\ ,extends:❯,precedes:❮,trail:· " Change listchars
set linebreak " Wrap long lines at a blank
set showbreak=↪  " Change wrap line break
set nrformats=bin,hex,unsigned


if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif

set sw=4 ts=4 sts=4 et
set shiftround

" Set change point to prevent <C-U> <C-W> wipes undo history
if empty(mapcheck('<C-U>', 'i'))
  imap <C-U> <C-G>u<C-U>
endif
if empty(mapcheck('<C-W>', 'i'))
  imap <C-W> <C-G>u<C-W>
endif

au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal! g'\"zz" | endif

let g:session_default_overwrite=v:true
let g:session_autoload='no'
let g:session_autosave='no'

let g:AutoPairsMapCh=v:false

" vim-sneak Here ---------------
let g:sneak#s_next=1
let g:sneak#use_ic_scs=1

" Airline Here -------------
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#default#section_use_groupitems=0
let g:airline#extensions#tabline#fnametruncate=20
let g:airline_theme="onedark"

let g:camelcasemotion_key=','

" editorconfig
let g:EditorConfig_exclude_patterns=['fugitive://.*', 'scp://.*']

" fugitive
let g:airline#extensions#fugitiveline#enabled=1

" FileType specifies Here -------

" au BufNewFile,BufRead *.cpp set syntax=cpp11

augroup filetype_indent
  au!
  au FileType python,vim,c,cpp setl sw=4 ts=4 sts=4 et
  au FileType make,mkd,markdown setl sw=4 ts=4 sts=4 noet
  au FileType ruby,eruby,yaml setl sw=2 ts=2 sts=2 et
  " au FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  " au FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
  au FileType coffee,jade setl sw=2 ts=2 sts=2 et
  au FileType asm setl sw=4 ts=4 sts=4 noet
  au FileType neosnippet setl noet
  au FileType java setl sw=4 ts=4 sts=4 et
  au FileType gotmpl,helm setl sw=2 ts=2 sts=2 et
  au FileType lua,vim setl sw=2 ts=2 sts=2 et
  au FileType gitcommit setlocal spell

  au BufRead,BufNewFile nginx.d/*.conf set ft=nginx
  au BufRead,BufNewFile *.nginx set ft=nginx
  au BufRead,BufNewFile *.nginx.* set ft=nginx
  au BufRead,BufNewFile nginx.conf.* set ft=nginx
  " au BufRead,BufNewFile */playbooks/**/*.yml set filetype=yaml.ansible
augroup END

" FileType specs End ----------

lua require 'my_keymaps'

command! W SudaWrite
cnoremap w!! W

