export HISTFILE=$ZSH_CACHE_DIR/zhistory

# Enable vim command mode with 0.1s lag
bindkey -v
export KEYTIMEOUT=1

setopt autocd

autoload -U colors
colors

typeset -gU cdpath fpath mailpath path
cdpath=(~ $cdpath)
fpath=($ZDOTDIR/functions $fpath)
path=(~/.bin $path)

autoload -U +X compinit
compinit -d $ZSH_DATA_HOME/.zcompdump

alias cdpath='printf "%s\n" $cdpath'
alias cdpaths='cdpath | sort --ignore-case'
alias envs='env | sort --ignore-case'
alias gw='./gradlew'
alias la='ls -GFlas'
alias ll='ls -l'
alias path='printf "%s\n" $path'
alias paths='path | sort --ignore-case'

# Make a shorthand version of each git alias
for al in $(git --list-cmds=alias 2>/dev/null); do
  alias g$al="git $al"
done

# which + show actual path if it's a link
ww() { which "$@" && readlink $(which "$@") || true ; }

# complete -F _gradle -d gw

eval "$(direnv hook zsh)"

# Set vimrc's location and source it on vim startup
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'

export DOCKER_CONFIG=$XDG_CONFIG_HOME/docker

export SSL_CERT_FILE=~/.ssh/cacert.pem

. $ZDOTDIR/prompt.zsh

. ~/.dale/zshrc

