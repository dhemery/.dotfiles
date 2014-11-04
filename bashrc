set -o vi
shopt -s autocd
export SHELL=$(which bash)

BASH_COMPLETION="/usr/local/etc/bash_completion.d"
GIT_PROMPT="$BASH_COMPLETION/git-prompt.sh"
GIT_COMPLETION="$BASH_COMPLETION/git-completion.bash"

if [[ -s $GIT_COMPLETION ]]
then
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
    export PROMPT_COMMAND='__git_ps1 "$PS1_DIR" " $PS1_PROMPT_MARKER " " [%s]"'
else
    export PS1="$PS1_DIR $PS1_PROMPT_MARKER "
fi

set_titlebar() {
    title=()
    gitdir="$(__gitdir)"
    if [[ -n $gitdir ]]
    then
        # If in a git repo, start the title with [project name].
        projectdir="$(dirname $gitdir)"
        projectname="${projectdir##*/}"
        title+="[$projectname] "
    fi
    title+=${PWD##*/}

    printf "\033]0;%s\007" "$title"
}

export PROMPT_COMMAND="set_titlebar; $PROMPT_COMMAND"
eval "$(direnv hook bash)"

. "$HOME/.dale/local.bash"

JAVA_HOME_COMMAND='/usr/libexec/java_home'
DEFAULT_JDK=${DEFAULT_JDK:=7}

[[ -x ${JAVA_HOME_COMMAND} ]] && jdk () { export JAVA_HOME=$(${JAVA_HOME_COMMAND} -v 1."$@") ; }
[[ -n $(declare -F jdk) ]] && jdk ${DEFAULT_JDK}

envs() { env | sort; }
la() { ls -GFlas "$@" ; }
path() { echo -e ${PATH//:/\\n}; }

