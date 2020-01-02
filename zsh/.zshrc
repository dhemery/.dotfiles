path=(~/.bin $path)
fpath=($ZDOTDIR/.zsh $fpath)

export ZSH_DATA_HOME=$XDG_DATA_HOME/zsh

export HISTFILE=$ZSH_DATA_HOME/zsh_history
export HISTSIZE=1000
export SAVEHIST=$HISTSIZE

export EDITOR=vim
export VISUAL=vim

# Enable vim command mode and set <ESC> key lag to 0.1s
bindkey -v
export KEYTIMEOUT=1

# Liquid prompt script (if this is an interactive shell)
# [[ $- = *i* ]] \
    # && source_first \
    # "/usr/local/share/liquidprompt" \
    # "$HOME/.installed/liquidprompt/liquidprompt"

# Replace liquidprompt's _lp_title(), which prepends an unwanted newline if
# LP_ENABLE_TITLE is on.
# _lp_title()
# {
  # echo -nE "${_LP_OPEN_ESC}${LP_TITLE_OPEN}$(_lp_as_text "$1")${LP_TITLE_CLOSE}${_LP_CLOSE_ESC}"
# }

autoload -U +X compinit && compinit -d $ZSH_DATA_HOME/.zcompdump

# Make a shorthand version of each git alias
for al in $(git --list-cmds=alias 2>/dev/null); do
  alias g$al="git $al"
done

# eval "$(direnv hook bash)"

alias envs='env | sort'
alias gw='./gradlew'
alias la='ls -GFlas'
alias ll='ls -l'
# alias path='echo -e "${PATH//:/\\n}"'
# alias paths='path | sort --ignore-case'

ww() { which "$@" && readlink $(which "$@") || true ; }

# complete -F _gradle -d gw

# [[ -f $HOME/.bash_local ]] && . $HOME/.bash_local

export DOCKER_CONFIG=$XDG_CONFIG_HOME/docker

# TODO: Why do I need this?
export SSL_CERT_FILE="$HOME/.ssh/cacert.pem"

# Set vimrc's location and source it on vim startup
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
