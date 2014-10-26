export SHELL=`which bash`
EXTRAS="/usr/local"
BASH_COMPLETION="$EXTRAS/etc/bash_completion.d"
GIT_COMPLETION="$BASH_COMPLETION/git-completion.bash"

set -o vi
shopt -s autocd

. "$HOME/.bash/aliases.bash"
. "$HOME/.dale/local.bash"
. "$HOME/.bash/titlebar.bash"
. "$HOME/.bash/prompt.bash"

[[ -s $GIT_COMPLETION ]] && . $GIT_COMPLETION

eval "$(direnv hook bash)"
