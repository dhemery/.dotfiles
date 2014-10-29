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
