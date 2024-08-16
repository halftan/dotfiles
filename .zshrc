# Path to your oh-my-zsh configuration.
# ZSH=$HOME/.oh-my-zsh
# zmodload zsh/zprof
setopt prompt_subst

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

if [[ ! -f $HOME/.zi/bin/zi.zsh ]]; then
    print -P "%F{33}▓▒░ %F{160}Installing (%F{33}z-shell/zi%F{160})…%f"
    command mkdir -p "$HOME/.zi" && command chmod go-rwX "$HOME/.zi"
    command git clone -q --depth=1 --branch "main" https://github.com/z-shell/zi "$HOME/.zi/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi
source "$HOME/.zi/bin/zi.zsh"
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi
# examples here -> https://wiki.zshell.dev/ecosystem/category/-annexes
zicompinit # <- https://wiki.zshell.dev/docs/guides/commands

if [[ -r "/Users/andyzhang/.config/zi/init.zsh" ]]; then
    source "/Users/andyzhang/.config/zi/init.zsh" && zzinit
fi


# Annexes https://wiki.zshell.dev/ecosystem/annexes/overview
zi light z-shell/z-a-bin-gem-node

zi-turbo '0a' is-snippet for \
    OMZL::git.zsh \
    OMZL::completion.zsh \
    OMZL::directories.zsh \
    OMZL::history.zsh \
    OMZL::key-bindings.zsh \
    OMZL::functions.zsh \
    OMZL::spectrum.zsh \
    OMZL::termsupport.zsh \
    OMZL::vcs_info.zsh \

zi ice wait'1' lucid
zi light z-shell/F-Sy-H

zi-turbo '1a' is-snippet for \
    OMZP::sudo \
    OMZP::git \
    OMZP::encode64 \
    OMZP::extract \
    OMZP::gitignore \
    OMZP::urltools
zi-turbo '1b' for \
    atload'!_zsh_autosuggest_start' \
        zsh-users/zsh-autosuggestions \
    zsh-users/zsh-history-substring-search \
    atload" \
        zstyle ':completion:*:git-checkout:*' sort false;
        zstyle ':completion:*:descriptions' format '[%d]';
        zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS};
        zstyle ':completion:*' menu no;
        zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath';
        zstyle ':fzf-tab:*' switch-group '<' '>';
        enable-fzf-tab" \
        Aloxaf/fzf-tab

zi lucid for pick"/dev/null" multisrc"{async,pure}.zsh" \
atload"!prompt_pure_precmd" nocd \
  sindresorhus/pure

zi-turbo '3c' is-snippet for \
    if:'[[ -d ~/.nvm ]]' \
    OMZP::nvm \
    has'go' \
    OMZP::golang \
    has'swiftc' \
    OMZP::swiftpm \
    has'npm' \
    OMZP::npm \
    has'pyenv' \
    OMZP::pyenv \
    has'pip' \
    OMZP::pip \
    has'python' \
    OMZP::python \
    has'docker-compose' \
    OMZP::docker-compose \
    has'tig' \
    OMZP::tig \
    has'fzf' \
    OMZP::fzf

zi-turbo '3b' is-snippet as"completion" for \
    OMZP::extract/_extract \
    OMZP::golang/_golang \
    OMZP::swiftpm/_swift \
    OMZP::pip/_pip \
    has'docker' as'completion' \
    https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker \
    has'docker-compose' \
    OMZP::docker-compose/_docker-compose
zi-turbo '3b' as"completion" for \
    zsh-users/zsh-completions

zi-turbo '3c' as"null" for \
    sbin Fakerr/git-recall \
    sbin paulirish/git-open \
    sbin paulirish/git-recent \
    MichaelAquilina/zsh-you-should-use

# if (( $+commands[starship] )); then
#     if [[ -f "$HOME/git/dotfiles/starship.toml" ]]; then
#         export STARSHIP_CONFIG="$HOME/git/dotfiles/starship.toml"
#     fi
#     eval "$(starship init zsh)"
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
