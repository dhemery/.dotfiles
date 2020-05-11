shared_zshrc=$DHE_SHARED_DOTFILES/zsh/zshrc
[[ -f $shared_zshrc ]] && . $shared_zshrc

local_zshrc=$DHE_LOCAL_DOTFILES/zsh/zshrc
[[ -f $local_zshrc ]] && . $local_zshrc
