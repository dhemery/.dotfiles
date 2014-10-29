export SHELL=$(which bash)

function_exists() {
    declare -f -F $1 > /dev/null
    return $?
}

set -o vi
shopt -s autocd

. "$HOME/.bash/git.bash"
. "$HOME/.bash/functions.bash"
. "$HOME/.dale/local.bash"

. "$HOME/.bash/prompt.bash"
. "$HOME/.bash/titlebar.bash"
eval "$(direnv hook bash)"

