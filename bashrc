set -o vi
shopt -s autocd
export SHELL=$(which bash)

function_exists() {
    declare -f -F $1 > /dev/null
    return $?
}

envs() { env | sort; }
la() { ls -GFlas "$@" ; }
path() { echo -e ${PATH//:/\\n}; }
jdk () { export JAVA_HOME=$(/usr/libexec/java_home -v 1."$@") ; }

BASH_COMPLETION="/usr/local/etc/bash_completion.d"
GIT_PROMPT="$BASH_COMPLETION/git-prompt.sh"
GIT_COMPLETION="$BASH_COMPLETION/git-completion.bash"

if [[ -s $GIT_PROMPT ]]
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
fi

if [[ -s $GIT_COMPLETION ]]
then
    . $GIT_COMPLETION

    for al in `__git_aliases`; do
        alias g$al="git $al"

        complete_func=_git_$(__git_aliased_command $al)
        function_exists $complete_fnc && __git_complete g$al $complete_func
    done
fi

BLUE="\[\e[34m\]"
BLACK="\[\e[0m\]"

PS1_DIR="$BLUE\W$BLACK"
PS1_PROMPT_MARKER="$BLUE\$$BLACK"

if [[ -n $(declare -F __git_ps1) ]]
then
    echo "Found it"
    export PROMPT_COMMAND='__git_ps1 "$PS1_DIR" " $PS1_PROMPT_MARKER " " [%s]"'
else
    echo "doodnt' found it"
    export PS1="$PS1_DIR $PS1_PROMPT_MARKER "
fi

. "$HOME/.bash/titlebar.bash"

eval "$(direnv hook bash)"

jdk 7

. "$HOME/.dale/local.bash"

