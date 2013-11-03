
export LC_ALL="zh_CN.UTF-8"
export LANG="zh_CN.UTF-8"
export LC_COLLATE="C"

export XMODIFIERS=@im=fcitx
export QT_IM_MODULE=fcitx
export GTK_IM_MODULE=fcitx

# Start X at Login
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
