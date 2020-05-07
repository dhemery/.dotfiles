export HISTFILE=$ZSH_CACHE_DIR/zhistory
export MYVIMRC=$XDG_CONFIG_HOME/vim/vimrc
export VIMINIT='source $MYVIMRC'
export DOCKER_CONFIG=$XDG_CONFIG_HOME/docker

# Enable vim command mode with 0.1s lag
bindkey -v
export KEYTIMEOUT=1

setopt autocd

autoload -U colors
colors

typeset -gU cdpath fpath mailpath path
cdpath=(~ $cdpath)

autoload -U +X compinit
compinit -d $ZSH_DATA_HOME/.zcompdump
compdef _gradle gw

jdk () { export JAVA_HOME=$(/usr/libexec/java_home -v "$@"); }
ww() { which "$@" && readlink $(which "$@") || true ; }

eval "$(direnv hook zsh)"

source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/prompt.zsh

private_zshrc=~/.dale/zsh/.zshrc
[[ -f $private_zshrc ]] && source $private_zshrc
