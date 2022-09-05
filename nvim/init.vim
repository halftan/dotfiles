let mapleader = "\\"
" Load packer.nvim
lua <<EOF
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
  end

  return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    -- My plugins here
    -- use 'foo1/bar1.nvim'
    -- use 'foo2/bar2.nvim'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
      require('packer').sync()
    end
  end)
EOF

lua require('plugins')

set background=dark
colorscheme onedark
set virtualedit=block,onemore " Allow for cursor beyond last character
set updatetime=500
set undofile
set undolevels=1000
set number relativenumber

"-----------------------------------
"  Fancy fonts
"-----------------------------------
set list " Show these tabs and spaces and so on
set listchars=tab:▸\ ,extends:❯,precedes:❮,trail:· " Change listchars
set linebreak " Wrap long lines at a blank
set showbreak=↪  " Change wrap line break


" FileType specifies Here -------

" au BufNewFile,BufRead *.cpp set syntax=cpp11

set sw=4 ts=4 sts=4 et
set shiftround

augroup filetype_indent
    au FileType python,vim,c,cpp setl sw=4 ts=4 sts=4 et
    au FileType make,mkd,markdown setl sw=4 ts=4 sts=4 noet
    au FileType ruby,eruby,yaml setl sw=2 ts=2 sts=2 et
    au FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
    au FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
    au FileType coffee,jade setl sw=2 ts=2 sts=2 et
    au FileType asm setl sw=4 ts=4 sts=4 noet
    au FileType neosnippet setl noet
    au FileType java setl sw=4 ts=4 sts=4 et
    au FileType gotmpl,helm setl sw=2 ts=2 sts=2 et
    au FileType lua,vim setl sw=2 ts=2 sts=2 et
    au FileType gitcommit setlocal spell
augroup END

" FileType specs End ----------

augroup filetype_specs
    au FileType html let b:delimitMate_matchpairs = "(:),[:],{:},<:>"
    au FileType scheme,lisp RainbowParenthesesToggle
    " Auto format python code on save
    au BufWritePre *.py execute ':Black'
augroup END

au BufRead,BufNewFile nginx.d/*.conf set ft=nginx
au BufRead,BufNewFile *.nginx set ft=nginx
au BufRead,BufNewFile *.nginx.* set ft=nginx
au BufRead,BufNewFile nginx.conf.* set ft=nginx

" vim-sneak Here ---------------
let g:sneak#s_next=1
let g:sneak#use_ic_scs=1

" Airline Here -------------
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#default#section_use_groupitems = 0
let g:airline#extensions#tabline#fnametruncate = 20
let g:airline_theme = "onedark"

let g:camelcasemotion_key = '<leader>'

" editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" fugitive
let g:airline#extensions#fugitiveline#enabled = 1

nmap H gT
nmap L gt

nnoremap <space>/ <cmd>nohlsearch<cr>
nnoremap <space>. <cmd>Telescope buffers<cr>
nnoremap <space>: <cmd>Telescope commands<cr>

nnoremap <space>wd <cmd>q<cr>
nnoremap <space>wl <c-w>l
nnoremap <space>wh <c-w>h
nnoremap <space>wj <c-w>j
nnoremap <space>wk <c-w>k
nnoremap <space>w/ <cmd>vs<cr>
nnoremap <space>ws <cmd>sp<cr>

nnoremap <space>s/ <cmd>Telescope live_grep<cr>
nnoremap <space>sP <cmd>Telescope grep_string<cr>

nnoremap <space>pp <cmd>Telescope find_files<cr>

nnoremap <space>fs :w<cr>
nnoremap <space>ff <cmd>Telescope find_files<cr>
nnoremap <space>fh <cmd>Telescope help_tags<cr>
nnoremap <space>ft <cmd>Telescope tags<cr>
nnoremap <space>fc <cmd>Telescope colorscheme<cr>
nnoremap <space>f" <cmd>Telescope registers<cr>
nnoremap <space>fr <cmd>Telescope resume<cr>

nnoremap <space>bb <cmd>Telescope buffers<cr>
nnoremap <space>b/ <cmd>Telescope current_buffer_fuzzy_find<cr>

nnoremap <space><space>j <cmd>HopLineAC<cr>
nnoremap <space><space>k <cmd>HopLineBC<cr>
nnoremap <space><space>/ <cmd>HopChar2<cr>
nnoremap <space><space>f <cmd>HopChar1CurrentLineAC<cr>
nnoremap <space><space>F <cmd>HopChar1CurrentLineBC<cr>
nnoremap <space><space>w <cmd>HopWordAC<cr>
nnoremap <space><space>b <cmd>HopWordBC<cr>

nnoremap <space>ti <cmd>IndentLinesToggle<cr>

nnoremap <space>vpi <cmd>PackerInstall<cr>
nnoremap <space>vps <cmd>PackerSync<cr>
nnoremap <space>vpc <cmd>PackerCompile<cr>
nnoremap <space>vpC <cmd>PackerClean<cr>
nnoremap <space>vfd <cmd>tabe $MYVIMRC<cr>
nnoremap <space>vfp <cmd>exe 'tabe ' .. fnamemodify($MYVIMRC, ':h') .. '/lua/plugins.lua'<cr>
