shared_zshrc=$DHE_SHARED_ZDOTDIR/zshrc
[[ -f $shared_zshrc ]] && . $shared_zshrc

local_zshrc=$DHE_LOCAL_ZDOTDIR/zshrc
[[ -f $local_zshrc ]] && . $local_zshrc
