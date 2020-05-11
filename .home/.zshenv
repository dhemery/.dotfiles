export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export ZSH_CACHE_DIR=$XDG_CACHE_HOME/zsh

export EDITOR=vim
export VISUAL=vim

export DHE_DOTFILES=$HOME/.dotfiles
export DHE_SHARED_DOTFILES=$DHE_DOTFILES/shared
export DHE_LOCAL_DOTFILES=$DHE_DOTFILES/local

shared_zshenv=$DHE_SHARED_DOTFILES/zsh/zshenv
[[ -f $shared_zshenv ]] && . $shared_zshenv

local_zshenv=$DHE_LOCAL_DOTFILES/zsh/zshenv
[[ -f $local_zshenv ]] && . $local_zshenv
