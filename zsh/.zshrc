export HISTFILE=$ZSH_CACHE_DIR/zhistory
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
export DOCKER_CONFIG=$XDG_CONFIG_HOME/docker
export SSL_CERT_FILE=~/.ssh/cacert.pem

path=(~/.bin $path)
cdpath=(~ $cdpath)

ZSH_COMPDUMP=$ZSH_CACHE_DIR/zcompdump

export ZSH=~/.oh-my-zsh
ZSH_THEME=""
plugins=(dash direnv docker git golang vi-mode)
source $ZSH/oh-my-zsh.sh

local_zshrc=~/.dale/zshrc
[[ -f $local_zshrc ]] && source $local_zshrc

source $ZDOTDIR/prompt.zsh
