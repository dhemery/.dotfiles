set -o vi
shopt -s autocd

. "$HOME/.bash/aliases.bash"

. "$HOME/.dale/local.bash"

. "$HOME/.bash/prompt.bash"
. "$HOME/.bash/git-completion.bash"
. "$HOME/.bash/titlebar.bash"

eval "$(direnv hook bash)"
