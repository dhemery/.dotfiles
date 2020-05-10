if filereadable(expand('$DHE_SHARED_DOTFILES/vim/vimrc'))
  source $DHE_SHARED_DOTFILES/vim/vimrc
endif

if filereadable(expand('$DHE_LOCAL_DOTFILES/vim/vimrc'))
  source $DHE_LOCAL_DOTFILES/vim/vimrc
endif
