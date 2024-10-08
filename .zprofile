export COLORTERM=truecolor
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LC_COLLATE="C"

export XMODIFIERS=@im=fcitx
export QT_IM_MODULE=fcitx
export GTK_IM_MODULE=fcitx

export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH"
# eval "$(pyenv init --path)"

# Set PATH, MANPATH, etc., for Homebrew.
[ $(uname -m) = "arm64" ] && eval "$(/opt/homebrew/bin/brew shellenv)"

# Created by `pipx` on 2024-01-19 05:07:14
export PATH="$PATH:/Users/andyzhang/.local/bin"
