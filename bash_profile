# vim: set ft=sh:

set -o vi
shopt -s autocd
export EDITOR='vim'
export PATH="${PATH}:."

source "$HOME/.bash/aliases.bash"
source "$HOME/.dale/bash_profile"
source "$HOME/.bash/prompt.bash"
source "$HOME/.bash/git-completion.bash"
source "$HOME/.bash/titlebar.bash"

