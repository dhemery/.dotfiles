set -o vi
shopt -s autocd

export PATH=${PATH}:.:${HOME}/.bin
export EDITOR='vim'

OS_NAME="$(uname)"

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

if [[ -f $BASH_COMPLETION_SCRIPT ]]
then
    . $BASH_COMPLETION_SCRIPT
fi

if [[ -d $BASH_COMPLETIONS ]]
then
    GIT_COMPLETION_SCRIPT="$BASH_COMPLETIONS/git-completion.bash"
fi

if [[ -f $GIT_COMPLETION_SCRIPT ]]
then
    . $GIT_COMPLETION_SCRIPT

    for al in $(__git_aliases); do
        # Make a shorthand version of each alias
        alias g$al="git $al"

        # Complete the alias as if it were the original command
        complete_func=_git_$(__git_aliased_command $al)
        [[ -n $(declare -F $complete_fnc) ]] && __git_complete g$al $complete_func
    done
fi

if [ -f /usr/local/share/liquidprompt ]; then
    . /usr/local/share/liquidprompt
fi

eval "$(direnv hook bash)"

LOCAL_BASH_CONFIG="$HOME/.dale/local.bash"
[[ -f $LOCAL_BASH_CONFIG ]] && . $LOCAL_BASH_CONFIG

envs() { env | sort; }
gw() { gradlew "$@"; }
la() { ls -GFlas "$@" ; }
path() { echo -e ${PATH//:/\\n}; }

complete -F _gradle -d gw

export XDG_CONFIG_HOME="$HOME/.config"

# added by travis gem
[ -f /Users/Dale/.travis/travis.sh ] && source /Users/Dale/.travis/travis.sh

. ~/.dockerrc
