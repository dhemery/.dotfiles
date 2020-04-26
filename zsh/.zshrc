export HISTFILE=$ZSH_CACHE_DIR/zhistory
ZSH_COMPDUMP=$ZSH_CACHE_DIR/zcompdump

export ZSH=~/.oh-my-zsh
ZSH_THEME=""
plugins=(dash direnv docker git golang vi-mode)
source $ZSH/oh-my-zsh.sh

path=(~/.bin $path)
cdpath=(~ $cdpath)

source $ZDOTDIR/prompt.zsh

# Switch to JDK 1.8, 9, 10, 11, …
jdk () { export JAVA_HOME=$(/usr/libexec/java_home -v "$@"); }

export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
export DOCKER_CONFIG=$XDG_CONFIG_HOME/docker

local_zshrc=~/.dale/zsh/.zshrc
[[ -f $local_zshrc ]] && source $local_zshrc
