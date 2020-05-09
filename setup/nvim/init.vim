if filereadable(expand('$DHE_SHARED_DOTFILES/nvim/init.vim'))
  source $DHE_SHARED_DOTFILES/nvim/init.vim
endif

if filereadable(expand('$DHE_LOCAL_DOTFILES/nvim/init.vim'))
  source $DHE_LOCAL_DOTFILES/nvim/init.vim
endif
