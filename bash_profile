set -o vi
shopt -s autocd
export EDITOR='vim'
export PATH="${PATH}:."

. "$HOME/.bash/aliases.bash"

. "$HOME/.dale/local.bash"

. "$HOME/.bash/colors.bash"
. "$HOME/.bash/prompt.bash"
. "$HOME/.bash/git-completion.bash"
. "$HOME/.bash/titlebar.bash"
