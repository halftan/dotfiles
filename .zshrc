# Path to your oh-my-zsh configuration.
# ZSH=$HOME/.oh-my-zsh

export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/opt/go/libexec/bin:/usr/local/sbin
[[ :$PATH: == *:$HOME/bin:* ]] || PATH=$HOME/bin:$PATH

export ENHANCD_COMMAND=cdd

DEFAULT_USER="halftan"

# Example aliases
alias zshconfig="${EDITOR} ~/.zshrc"
# alias ohmyzsh="${EDITOR} ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Disable zsh magic functions like url-quote-magic
DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# zplug
if [[ -e /usr/local/opt/zplug ]]; then
    export ZPLUG_HOME=/usr/local/opt/zplug
else
    export ZPLUG_HOME=$HOME/.zplug
fi
source $ZPLUG_HOME/init.zsh

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:2
zplug "zsh-users/zsh-autosuggestions"

zplug "robbyrussell/oh-my-zsh", as:plugin, use:"oh-my-zsh.sh"

zplug "plugins/extract", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/history", from:oh-my-zsh
zplug "plugins/autojump", from:oh-my-zsh
# zplug "plugins/emacs", from:oh-my-zsh
# 
zplug "plugins/golang", from:oh-my-zsh
zplug "plugins/tig", from:oh-my-zsh
zplug "plugins/gitignore", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/npm", from:oh-my-zsh
zplug "plugins/nvm", from:oh-my-zsh
zplug "plugins/pip", from:oh-my-zsh
zplug "plugins/pyenv", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/docker-compose", from:oh-my-zsh

# zplug "plugins/kubectl", from:oh-my-zsh
# zplug "plugins/minikube", from:oh-my-zsh
# zplug "plugins/helm", from:oh-my-zsh
# zplug "plugins/urltools", from:oh-my-zsh
zplug "plugins/fzf", from:oh-my-zsh

zplug "denysdovhan/gitio-zsh"
zplug "Tarrasch/zsh-autoenv"
zplug "paulirish/git-open"
# zplug "b4b4r07/enhancd", use:init.sh

# zplug "b4b4r07/httpstat", \
#     as:command, \
#     use:'(*).sh', \
#     rename-to:'$1'

# zplug "spaceship-prompt/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load # --verbose

eval "$(starship init zsh)"
if [[ -f "$HOME/git/dotfiles/starship.toml" ]]; then
    export STARSHIP_CONFIG="$HOME/git/dotfiles/starship.toml"
fi

# # Load antigen
# ANTIGEN_PATH=''
# if [[ -f  /usr/local/share/antigen/antigen.zsh ]]; then
#     ANTIGEN_PATH="/usr/local/share/antigen/antigen.zsh"
# elif [[ -f /usr/share/antigen/share/antigen.zsh ]]; then
#     ANTIGEN_PATH="/usr/share/antigen/share/antigen.zsh"
# elif [[ -f $HOME/.antigen.zsh ]]; then
#     ANTIGEN_PATH="$HOME/.antigen.zsh"
# fi

# if [[ -n "$ANTIGEN_PATH" ]]; then
#     source "$ANTIGEN_PATH"
#     antigen init ~/.antigenrc
# fi

if [ $commands[nvim] ]; then
    export EDITOR=nvim
elif [ $commands[vim] ]; then
    export EDITOR=vim
fi

export LANG="en_US.UTF-8"
export LESS=-Ri
if [[ -f "/usr/local/etc/openssl@1.1/cert.pem" ]]; then
    export NODE_EXTRA_CA_CERTS="/usr/local/etc/openssl@1.1/cert.pem"
    export SSL_CERT_FILE="/usr/local/etc/openssl@1.1/cert.pem"
fi

if [[ -n "WSL_DISTRO_NAME" ]]; then
    export GPG_TTY=$(tty)
fi

function pyenv_prompt_info() {
    echo "$(pyenv version-name)"
}

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --no-ignore-vcs --vimgrep -g !.git'

export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSTALL_CLEANUP=1
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"

if [[ $commands[go] ]]; then
    export GOBIN=$HOME/goworkspace/bin
    export GOPATH=$HOME/goworkspace
    export GOROOT=`go env GOROOT`
    PATH=$GOBIN:$PATH
fi

if [ $commands[sw_vers] ]; then
    # Mac OS X
    # export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
    export ON_MAC_OS=1
    # export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"
    # PATH="$(brew --prefix vim)/bin:$PATH"
else
    # Linux
    # plugins=($plugins systemd)
fi

if [[ $ON_MAC_OS ]]; then
    # LUNCHY_DIR=$(dirname `gem which lunchy`)/../extras
    # if [ -f $LUNCHY_DIR/lunchy-completion.zsh ]; then
    #     . $LUNCHY_DIR/lunchy-completion.zsh
    # fi
    if [[ -e /usr/local/opt/coreutils ]]; then
        PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
        MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
    fi
else
    if [ $commands[yarn] ]; then
        PATH=$(yarn global bin):$PATH
    fi
fi

if [[ -e "$HOME/.emacs.d" ]]; then
    PATH="$HOME/.emacs.d/bin":$PATH
fi

if [[ -e "/usr/local/opt/ansible@2.9/bin" ]]; then
    PATH="/usr/local/opt/ansible@2.9/bin:$PATH"
fi

if [[ -e ~/.zsh_alias ]]; then
    . ~/.zsh_alias
fi

if [[ -e ~/.zsh_local ]]; then
    . ~/.zsh_local
fi

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

if [[ -e "$HOME/.terminfo" ]]; then
    export TERM=xterm-24bits
fi

export -U PATH
export -U MANPATH

# export KUBECONFIG=$HOME/.kube/oneconfig.yaml

# autoload -U +X bashcompinit && bashcompinit
# if [[ -f "$ZSH_CACHE_DIR/kubectl_completion" ]]; then
#     autoload -U +X compinit && compinit
#     source "$ZSH_CACHE_DIR/kubectl_completion"
# fi

# complete -o nospace -F /Users/andy.zhang/bin/aliyun aliyun

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/Users/fengmzhang/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/Users/fengmzhang/opt/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/Users/fengmzhang/opt/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/Users/fengmzhang/opt/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

