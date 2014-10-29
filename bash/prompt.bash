BLUE="\[\e[34m\]"
BLACK="\[\e[0m\]"

PS1_DIR="$BLUE\W$BLACK"
PS1_PROMPT_MARKER="$BLUE\$$BLACK"

GIT_PS1_COMMAND=$(declare -F __git_ps1)

if [ -v GIT_PS1_COMMAND ]
then
    echo "Found it"
    export PROMPT_COMMAND='__git_ps1 "$PS1_DIR" " $PS1_PROMPT_MARKER " " [%s]"'
else
    echo "doodnt' found it"
    export PS1="$PS1_DIR $PS1_PROMPT_MARKER "
fi

