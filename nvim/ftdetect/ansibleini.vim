" au BufNewFile,BufRead inventory/[^.]\+$ set ft=ini
" au BufNewFile,BufRead inventory/*/[^.]\+$ set ft=ini
" au BufNewFile,BufRead */inventory/asdf set ft=confini

function! s:isAnsibleInventory()
  let filepath = expand("%:p")
  let filename = expand("%:t")
  if filename =~ '\v^[^.]+$'
        \ && (filepath =~ '\v/inventory/'
        \      || filepath =~ '\v/inventories/')
    return 1
  endif

  return 0
endfunction

augroup ansible_inventory_hostsft
    au!
    au BufNewFile,BufRead * if s:isAnsibleInventory() | set ft=confini.ansible_hosts | en
augroup END
