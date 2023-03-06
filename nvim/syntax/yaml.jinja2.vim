" Quit if a syntax file was already loaded
if exists("b:current_syntax")
  if b:current_syntax == "yaml.jinja2"
    finish
  endif
endif

" Use jinja2 and yaml syntax
runtime! syntax/yaml.vim
unlet b:current_syntax
runtime! syntax/jinja2.vim

let b:current_syntax = 'yaml.jinja2'
