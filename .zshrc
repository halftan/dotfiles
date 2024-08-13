# Path to your oh-my-zsh configuration.
# ZSH=$HOME/.oh-my-zsh

export PATH=$PATH:$BREW_PREFIX/bin:/usr/bin:/bin:/usr/sbin:/sbin:$BREW_PREFIX/opt/go/libexec/bin:$BREW_PREFIX/sbin
[[ :$PATH: == *:$HOME/bin:* ]] || PATH=$HOME/bin:$PATH

export ENHANCD_COMMAND=cdd

DEFAULT_USER="halftan"
BREW_PREFIX=$(brew --prefix)

# Example aliases
alias zshconfig="${EDITOR} ~/.zshrc"
# alias ohmyzsh="${EDITOR} ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

zstyle ':omz:update' mode disabled
# zstyle ':omz:lib:directories' aliases no

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

####################
## fzf-tab config ##
####################
# # disable sort when completing `git checkout`
# zstyle ':completion:*:git-checkout:*' sort false
# # set descriptions format to enable group support
# # NOTE: don't use escape sequences here, fzf-tab will ignore them
# zstyle ':completion:*:descriptions' format '[%d]'
# # set list-colors to enable filename colorizing
# zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# # force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
# zstyle ':completion:*' menu no
# # preview directory's content with eza when completing cd
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# # switch group using `<` and `>`
# zstyle ':fzf-tab:*' switch-group '<' '>'

# zplug
if [[ -e "$BREW_PREFIX/opt/zplug" ]]; then
    export ZPLUG_HOME="$BREW_PREFIX/opt/zplug"
else
    export ZPLUG_HOME=$HOME/.zplug
fi
source $ZPLUG_HOME/init.zsh

zplug "zsh-users/zsh-completions"
# zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zdharma-continuum/fast-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:2
zplug "zsh-users/zsh-autosuggestions", defer:2
# zplug "tysonwolker/iterm-tab-colors", defer:2

zplug "robbyrussell/oh-my-zsh", as:plugin, use:"oh-my-zsh.sh"

zplug "plugins/extract", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/history", from:oh-my-zsh
# zplug "plugins/autojump", from:oh-my-zsh
zplug "plugins/alias-finder", from:oh-my-zsh
zplug "plugins/aliases", from:oh-my-zsh
# zplug "plugins/emacs", from:oh-my-zsh

zplug "plugins/golang", from:oh-my-zsh
zplug "plugins/swiftpm", from:oh-my-zsh
zplug "plugins/tig", from:oh-my-zsh
zplug "plugins/gitignore", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/npm", from:oh-my-zsh
zplug "plugins/nvm", from:oh-my-zsh, lazy:true
zplug "plugins/pip", from:oh-my-zsh
zplug "plugins/pyenv", from:oh-my-zsh
if (( $+commands[docker] )); then
    zplug "plugins/docker", from:oh-my-zsh
    zplug "plugins/docker-compose", from:oh-my-zsh
fi

# zplug "plugins/kubectl", from:oh-my-zsh
# zplug "plugins/minikube", from:oh-my-zsh
# zplug "plugins/helm", from:oh-my-zsh
# zplug "plugins/urltools", from:oh-my-zsh
zplug "plugins/fzf", from:oh-my-zsh

zplug "denysdovhan/gitio-zsh"
# zplug "Tarrasch/zsh-autoenv"
zplug "paulirish/git-open"
# zplug "b4b4r07/enhancd", use:init.sh

# zplug "b4b4r07/httpstat", \
#     as:command, \
#     use:'(*).sh', \
#     rename-to:'$1'

# zplug "spaceship-prompt/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
zplug "MichaelAquilina/zsh-you-should-use"
zplug "Aloxaf/fzf-tab"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load # --verbose

if (( $+commands[starship] )); then
    if [[ -f "$HOME/git/dotfiles/starship.toml" ]]; then
        export STARSHIP_CONFIG="$HOME/git/dotfiles/starship.toml"
    fi
    eval "$(starship init zsh)"
fi

# # Load antigen
# ANTIGEN_PATH=''
# if [[ -f  $BREW_PREFIX/share/antigen/antigen.zsh ]]; then
#     ANTIGEN_PATH="$BREW_PREFIX/share/antigen/antigen.zsh"
# elif [[ -f /usr/share/antigen/share/antigen.zsh ]]; then
#     ANTIGEN_PATH="/usr/share/antigen/share/antigen.zsh"
# elif [[ -f $HOME/.antigen.zsh ]]; then
#     ANTIGEN_PATH="$HOME/.antigen.zsh"
# fi

# if [[ -n "$ANTIGEN_PATH" ]]; then
#     source "$ANTIGEN_PATH"
#     antigen init ~/.antigenrc
# fi

if (( $+commands[nvim] )); then
    export EDITOR=nvim
elif [ $+commands[vim] ]; then
    export EDITOR=vim
fi

export LANG="en_US.UTF-8"
export LESS=-Ri
if [[ -f "$BREW_PREFIX/etc/openssl@1.1/cert.pem" ]]; then
    export NODE_EXTRA_CA_CERTS="$BREW_PREFIX/etc/openssl@1.1/cert.pem"
    export SSL_CERT_FILE="$BREW_PREFIX/etc/openssl@1.1/cert.pem"
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
# export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"
# export HOMEBREW_API_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles/api"
# export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.ustc.edu.cn/homebrew-core.git"

if (( $+commands[go] )); then
    export GOBIN=$HOME/goworkspace/bin
    export GOPATH=$HOME/goworkspace
    export GOROOT=`go env GOROOT`
    PATH=$GOBIN:$PATH
fi

if [[ $OSTYPE == *darwin* ]]; then
    # Mac OS X
    export JAVA_HOME=$(/usr/libexec/java_home)
    export ON_MAC_OS=1
    # export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"
    # PATH="$(brew --prefix vim)/bin:$PATH"
else
    # Linux
    # plugins=($plugins systemd)
fi

if (( $ON_MAC_OS )); then
    if [[ -e $BREW_PREFIX/opt/coreutils ]]; then
        PATH="$BREW_PREFIX/opt/coreutils/libexec/gnubin:$PATH"
        MANPATH="$BREW_PREFIX/opt/coreutils/libexec/gnuman:$MANPATH"
    fi
fi
if (( $+commands[yarn] )); then
    PATH=$(yarn global bin):$PATH
fi

if (( $+commands[zoxide] )); then
  eval "$(zoxide init zsh --cmd j)"
fi

if [[ -e "$HOME/.emacs.d" ]]; then
    PATH="$HOME/.emacs.d/bin":$PATH
fi

if [[ -e "$BREW_PREFIX/opt/ansible@2.9/bin" ]]; then
    PATH="$BREW_PREFIX/opt/ansible@2.9/bin:$PATH"
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

export BAT_THEME=OneHalfDark

export -U PATH
export -U MANPATH
