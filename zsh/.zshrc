export HISTFILE=$ZSH_CACHE_DIR/zhistory
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
export DOCKER_CONFIG=$XDG_CONFIG_HOME/docker
export ZSH=~/.oh-my-zsh

# Switch to JDK 1.8, 9, 10, 11, …
jdk () { export JAVA_HOME=$(/usr/libexec/java_home -v "$@"); }

local_zshrc=~/.dale/zsh/.zshrc
[[ -f $local_zshrc ]] && source $local_zshrc

ZSH_COMPDUMP=$ZSH_CACHE_DIR/zcompdump
ZSH_THEME=""

path=(~/.bin $path)
cdpath=(~ $cdpath)
plugins=(dash direnv docker git golang vi-mode $plugins)

source $ZSH/oh-my-zsh.sh
source $ZDOTDIR/prompt.zsh
