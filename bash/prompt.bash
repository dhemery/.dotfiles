# Default identity is current user name
PS1_IDENTITY=${PS1_IDENTITY-$USER }

# Show * if unstanged changes, + if staged
GIT_PS1_SHOWDIRTYSTATE=1
# Show $ if stash
GIT_PS1_SHOWSTASHSTATE=1
# Show % if untracked files
GIT_PS1_SHOWUNTRACKEDFILES=1
# Show < if behind upstream, > if ahead, <> if diverged
GIT_PS1_SHOWUPSTREAM='auto verbose'

BLUE="\[\e[34m\]"
RED="\[\e[31m\]"
BLACK="\[\e[0m\]"

# Show current directory in blue.
PS1_DIR="$BLUE\W"
# Show git status in red.
PS1_GIT="$RED"'$(__git_ps1 " (%s)")'
PS1_PROMPT_MARKER="$BLACK $ "
# Show identity, then directory, then git status.
export PS1="$PS1_IDENTITY$PS1_DIR$PS1_GIT$PS1_PROMPT_MARKER"

