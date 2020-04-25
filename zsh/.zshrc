export HISTFILE=$ZSH_CACHE_DIR/zhistory

cdpath=(~ $cdpath)
path=(~/.bin $path)

# Set vimrc's location and source it on vim startup
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
export DOCKER_CONFIG=$XDG_CONFIG_HOME/docker
export SSL_CERT_FILE=~/.ssh/cacert.pem

ZSH_COMPDUMP=$ZSH_DATA_HOME/.zcompdump

export ZSH=~/.oh-my-zsh
ZSH_THEME="robbyrussell"

plugins=(dash direnv docker git golang)

source $ZSH/oh-my-zsh.sh

source ~/.dale/zshrc
