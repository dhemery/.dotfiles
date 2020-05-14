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
let g:netrw_altv=1            " v opens files to the right
let g:netrw_banner=1          " Show the banner (with help)
let g:netrw_browse_split=0    " Open files in the browser window
let g:netrw_home=stdpath('cache')
let g:netrw_liststyle=3       " Tree view

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

