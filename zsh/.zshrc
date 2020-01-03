export ZSH_DATA_HOME=$XDG_DATA_HOME/zsh
export HISTFILE=$ZSH_DATA_HOME/zsh_history
export HISTSIZE=1000
export SAVEHIST=$HISTSIZE
export EDITOR=vim
export VISUAL=vim

# Enable vim command mode with 0.1s lag
bindkey -v
export KEYTIMEOUT=1

setopt prompt_subst
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

autoload -Uz vcs_info
precmd() { vcs_info }

repo_prompt="%{$fg[blue]%}%r%{$reset_color%}"
branch_prompt="%{$fg[green]%}%b%{$reset_color%}"
staged_prompt="%{$fg[yellow]%}%c%{$reset_color%}"
unstaged_prompt="%{$fg[red]%}%u%{$reset_color%}"

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr '+'
zstyle ':vcs_info:git:*' unstagedstr '*'
zstyle ':vcs_info:git:*' formats "${repo_prompt} [${branch_prompt}${staged_prompt}${unstaged_prompt}]"

# Show dirs, always showing first one and last three.
PROMPT='[%F{blue}%(5~|%-1~/…/%3~|%4~)%f] %(?..%F{red}%?%f )%B%#%b '
RPROMPT='${vim_mode} ${vcs_info_msg_0_}'

. ~/.dale/zshrc
