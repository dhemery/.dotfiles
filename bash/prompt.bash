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
# Status color reflects status
GIT_PS1_SHOWCOLORHINTS=true

BLUE="\[\e[34m\]"
BLACK="\[\e[0m\]"

PS1_DIR="$BLUE\W$BLACK"
PS1_PROMPT_MARKER="$BLUE\$$BLACK"

. "/usr/local/etc/bash_completion.d/git-prompt.sh"

# Show identity, then directory, then git status, then prompt marker.
GIT_PROMPT_COMMAND='__git_ps1 "$PS1_IDENTITY$PS1_DIR" " $PS1_PROMPT_MARKER " " %s"'

# Prepend to any existing prompt command
PROMPT_COMMAND="$GIT_PROMPT_COMMAND; $PROMPT_COMMAND"
