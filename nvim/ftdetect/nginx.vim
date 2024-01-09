augroup nginx_ft
    au!
    au BufRead,BufNewFile nginx.d/*.conf set ft=nginx
    au BufRead,BufNewFile *.nginx set ft=nginx
    au BufRead,BufNewFile *.nginx.* set ft=nginx
    au BufRead,BufNewFile nginx.conf.* set ft=nginx
augroup END
