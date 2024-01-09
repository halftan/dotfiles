function! s:isAnsiblePlaybook()
  let filepath = expand("%:p")
  let filename = expand("%:t")
  if filename =~ '\v^.+\.ya?ml$'
        \ && filepath =~ '\v/playbooks/'
        \ && filepath !~ '\v/playbooks/.+/files/'
    return 1
  endif

  return 0
endfunction

augroup ansible_playbookft
    au!
    au BufNewFile,BufRead * if s:isAnsiblePlaybook() | set ft=yaml.ansible | en
augroup END
