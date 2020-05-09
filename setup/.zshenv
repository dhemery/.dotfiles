export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export ZSH_CACHE_DIR=$XDG_CACHE_HOME/zsh

export EDITOR=vim
export VISUAL=vim

export DHE_DOTFILES=$HOME/.dotfiles
export DHE_SHARED_DOTFILES=$DHE_DOTFILES/shared
export DHE_SHARED_ZDOTDIR=$DHE_SHARED_DOTFILES/zsh
export DHE_LOCAL_DOTFILES=$DHE_DOTFILES/local
export DHE_LOCAL_ZDOTDIR=$DHE_LOCAL_DOTFILES/zsh

shared_zshenv=$DHE_SHARED_ZDOTDIR/zshenv
[[ -f $shared_zshenv ]] && . $shared_zshenv

local_zshenv=$DHE_LOCAL_ZDOTDIR/zshenv
[[ -f $local_zshenv ]] && . $local_zshenv
