set -o vi
shopt -s autocd

export PATH=${PATH}:.:${HOME}/.bin
export EDITOR='vim'

LOCAL_BASH_CONFIG="$HOME/.dale/local.bash"
[[ -f $LOCAL_BASH_CONFIG ]] && . $LOCAL_BASH_CONFIG

if [[ -f $BASH_COMPLETION_SCRIPT ]]
then
    . $BASH_COMPLETION_SCRIPT
fi

if [[ -f $GIT_COMPLETION_SCRIPT ]]
then
    . $GIT_COMPLETION_SCRIPT

    for al in $(git_list_aliases); do
        # Make a shorthand version of each alias
        alias g$al="git $al"

        # Complete the alias as if it were the original command
        complete_func=_git_$(__git_aliased_command $al)
        [[ -n $(declare -F $complete_fnc) ]] && __git_complete g$al $complete_func
    done
fi

if [ -f $LIQUID_PROMPT_SCRIPT ]; then
    . $LIQUID_PROMPT_SCRIPT
fi

# Replace liquidprompt's _lp_title(), which prepends an unwanted newline if
# LP_ENABLE_TITLE is on.
_lp_title()
{
    echo -nE "${_LP_OPEN_ESC}${LP_TITLE_OPEN}$(_lp_as_text "$1")${LP_TITLE_CLOSE}${_LP_CLOSE_ESC}"
}

envs() { env | sort; }
gw() { gradlew "$@"; }
la() { ls -GFlas "$@" ; }
path() { echo -e ${PATH//:/\\n}; }

complete -F _gradle -d gw

export XDG_CONFIG_HOME="$HOME/.config"
