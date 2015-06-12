set -o vi
shopt -s autocd

export PATH=${PATH}:.
export EDITOR='vim'

OS_NAME="$(uname)"
echo "OS: $OS_NAME"

if [[ $OS_NAME = "Linux" ]]
then
    BASH_COMPLETION_HOME=/usr/share/bash-completion
    BASH_COMPLETIONS="$BASH_COMPLETION_HOME/completions"
fi

if [[ $OS_NAME = "Darwin" ]]
then
    BASH_COMPLETION_HOME=/usr/local/etc
    BASH_COMPLETIONS="$BASH_COMPLETION_HOME/bash_completion.d"
fi

BASH_COMPLETION_SCRIPT="$BASH_COMPLETION_HOME/bash_completion"

echo "Bash completion: $BASH_COMPLETION"
if [[ -f $BASH_COMPLETION ]]
then
    echo "Found bash completion"
    . $BASH_COMPLETION
fi

echo "Bash completions: $BASH_COMPLETIONS"
if [[ -d $BASH_COMPLETIONS ]]
then
    echo "Found bash completions"
    GIT_COMPLETION="$BASH_COMPLETIONS/git-completion.bash"
fi

GIT_PROMPT="$HOME/.git-prompt.sh"

echo "Git completion: $GIT_COMPLETION"
if [[ -f $GIT_COMPLETION ]]
then
    echo "Found git completion"
    . $GIT_COMPLETION

    for al in $(__git_aliases); do
        # Make a shorthand version of each alias
        alias g$al="git $al"

        # Complete the alias as if it were the original command
        complete_func=_git_$(__git_aliased_command $al)
        [[ -n $(declare -F $complete_fnc) ]] && __git_complete g$al $complete_func
    done
fi

BLUE="\[\e[34m\]"
BLACK="\[\e[0m\]"
PS1_DIR="$BLUE\W$BLACK"
PS1_PROMPT_MARKER="$BLUE\$$BLACK"

if [[ -f $GIT_PROMPT ]]
then
    # Show * if unstanged changes, + if staged
    GIT_PS1_SHOWDIRTYSTATE=1
    # Show $ if stash
    GIT_PS1_SHOWSTASHSTATE=1
    # Show % if untracked files
    GIT_PS1_SHOWUNTRACKEDFILES=1
    # Show < if behind upstream, > if ahead, <> if diverged
    GIT_PS1_SHOWUPSTREAM='auto verbose'
    # Status color reflects status
    GIT_PS1_SHOWCOLORHINTS=true

    . $GIT_PROMPT
    export PROMPT_COMMAND='__git_ps1 "$PS1_DIR" " $PS1_PROMPT_MARKER " " [%s]"'
else
    export PS1="$PS1_DIR $PS1_PROMPT_MARKER "
fi

set_titlebar() {
    gitdir="$(git rev-parse --git-dir 2>/dev/null)"
    # If there's a gitdir and it is relative, make it absolute
    [[ -z ${gitdir-} ]] || [[ $gitdir = /* ]] || gitdir="$PWD/${gitdir#./}"
    # If there's a gitdir, projectdir is its parent
    projectdir=''
    [[ -n ${gitdir-} ]] && projectdir="${gitdir%/*}"
    title=()
    # If there's a projectdir, put it into the title in brackets
    [[ -n ${projectdir-} ]] && title+=("[${projectdir##*/}]")
    # If current dir is not in projecdir, append current dir to the title
    [[ ${PWD} = ${projectdir} ]] || title+=("${PWD##*/}")
    printf "\033]0;%s\007" "${title[*]}"
}

export PROMPT_COMMAND="set_titlebar; $PROMPT_COMMAND"
eval "$(direnv hook bash)"

LOCAL_BASH_CONFIG="$HOME/.dale/local.bash"
[[ -f $LOCAL_BASH_CONFIG ]] && . $LOCAL_BASH_CONFIG

envs() { env | sort; }
la() { ls -GFlas "$@" ; }
path() { echo -e ${PATH//:/\\n}; }

export XDG_CONFIG_HOME="$HOME/.config"
