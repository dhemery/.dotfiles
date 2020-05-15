"---------------------------------------------------------------
" Packages
"---------------------------------------------------------------

set packpath+=$DHE_SHARED_DOTFILES/nvim

"---------------------------------------------------------------
" Buffers
"---------------------------------------------------------------

set hidden   " Abandoning a buffer hides it instead of closing.

"---------------------------------------------------------------
" Files
"---------------------------------------------------------------

set path+=**

"---------------------------------------------------------------
" Display
"---------------------------------------------------------------

set number relativenumber 
set cmdheight=2     " Avoid having to press <enter> to continue.
set linebreak       " Wrap lines at more reasonable places.
set noshowmode      " lightline shows the mode.

"---------------------------------------------------------------
" Syntax
"---------------------------------------------------------------

colorscheme slate
set guicursor=a:ver25

"---------------------------------------------------------------
" Search
"---------------------------------------------------------------
set ignorecase      " Case insensitive search...
set smartcase       " ... except when using capital letters
set nohlsearch

"---------------------------------------------------------------
" Formatting
"---------------------------------------------------------------

set expandtab       " Insert mode expands tabs to spaces
set shiftwidth=2    " # columns to indent with >> and <<
set formatoptions=tcqj  " :h fo-table for details

"--------------------------------------------------------------
" Key mapping
"--------------------------------------------------------------

let mapleader=' ' " Use space as leader

" Disable the arrow keys
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>

