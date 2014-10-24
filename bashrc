export SHELL=`which bash`

set -o vi
shopt -s autocd

. "$HOME/.bash/aliases.bash"

. "$HOME/.dale/local.bash"

. "$HOME/.bash/titlebar.bash"
. "/usr/local/etc/bash_completion.d/git-completion.bash"
. "$HOME/.bash/prompt.bash"

eval "$(direnv hook bash)"
