set packpath+=$DHE_SHARED_DOTFILES/nvim

"---------------------------------------------------------------
" General settings
"---------------------------------------------------------------

set hidden          " Abandoning a buffer (e.g. by opening
                    " another file) hides it instead of closing.

"--------------------------------------------------------------
" Key mapping
"--------------------------------------------------------------

let mapleader=' ' " Use space as leader

"---------------------------------------------------------------
" Display
"---------------------------------------------------------------

set number          " Display line numbers
set cmdheight=2     " Set the command window to 2 lines, to
                    " avoid having to press <enter> to continue
set linebreak       " Wrap lines at more reasonable places.

"---------------------------------------------------------------
" Colors
"---------------------------------------------------------------

syntax enable
colorscheme slate
highlight CursorLineNr cterm=underline
highlight CursorLine cterm=NONE ctermbg=236
set guicursor=a:ver25

"---------------------------------------------------------------
" Files
"---------------------------------------------------------------

set path+=**

"---------------------------------------------------------------
" Search
"---------------------------------------------------------------
set ignorecase      " Case insensitive search...
set smartcase       " ... except when using capital letters

" Turn off highlights in insert mode
autocmd InsertEnter * :setlocal nohlsearch

" Toggle search highlights
nnoremap <leader>/ :set hlsearch!<CR>

"---------------------------------------------------------------
" Formatting
"---------------------------------------------------------------

set expandtab       " Insert mode expands tabs to spaces
set shiftwidth=2    " # columns to indent with >> and <<

"---------------------------------------------------------------
" Motion
"---------------------------------------------------------------

" Kill the arrow keys
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>

"---------------------------------------------------------------
" Windows and Tabs
"---------------------------------------------------------------
nnoremap <leader>w <C-w>
augroup ShowActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

"---------------------------------------------------------------
" Browsing
"---------------------------------------------------------------
nnoremap <leader>x :e.<CR>
let g:netrw_altv=1            " v opens files to the right
let g:netrw_banner=1          " Show the banner (with help)
let g:netrw_browse_split=0    " Open files in the browser window
let g:netrw_home=stdpath('cache')
let g:netrw_liststyle=3       " Tree view

