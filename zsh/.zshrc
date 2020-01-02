export ZSH_DATA_HOME=$XDG_DATA_HOME/zsh
export HISTFILE=$ZSH_DATA_HOME/zsh_history
export HISTSIZE=1000
export SAVEHIST=$HISTSIZE
export EDITOR=vim
export VISUAL=vim

# Enable vim command mode with 0.1s lag
bindkey -v
export KEYTIMEOUT=1

setopt autocd

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

autoload -Uz vcs_info
setopt prompt_subst
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '%F{blue}%r%f [%F{green}%b%f]'
 


PROMPT='[%F{blue}%(5~|%-1~/…/%3~|%4~)%f] %# '
RPROMPT='${vcs_info_msg_0_}'

. ~/.dale/zshrc

