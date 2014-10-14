"---------------------------------------------------------------
" General settings
"---------------------------------------------------------------

set nocompatible    " Make Vim more vim-like, less vi-like.
set hidden          " Abandoning a buffer (e.g. by opening
                    " another file) hides it instead of closing.
set exrc            " Read any .vimrc file in the startup dir.

"--------------------------------------------------------------
" Command completion
"--------------------------------------------------------------

set wildmenu        " Enable the completion menu.
set wildmode=full   " Launch completion if multiple matches.

"--------------------------------------------------------------
" Key mapping
"--------------------------------------------------------------

let mapleader = "," " Use comma as leader

"---------------------------------------------------------------
" Filetype
"---------------------------------------------------------------

filetype on         " enable filetype detection
filetype plugin on  " enable filetype-specific plugins
filetype indent on  " enable filetype-specific indentation

"---------------------------------------------------------------
" Display
"---------------------------------------------------------------

set title           " Set the terminal window's title
set number          " Display line numbers
set laststatus=2    " Always display the status line
set showcmd         " Show partial commands in status
set ruler           " Display cursor position in status
set cmdheight=2     " Set the command window to 2 lines, to
                    " avoid having to press <enter> to continue
set visualbell      " Visual bell instead of beeping ...
set t_vb=           " ... and turn off the bell altogether
set t_Co=256        " Use all 256 of the terminal's colors.
set cursorline      " Highlight the line the cursor is on
set linebreak       " Wrap lines at more reasonable places.

" Consider tabs, trailing space, eol as invisible characters
set listchars=tab:>-,trail:·,eol:$

" ,s: Toggle showing invisible chracters
nnoremap <silent> <leader>s :set list!

"---------------------------------------------------------------
" Colors
"---------------------------------------------------------------

syntax enable       " Enable syntax highlighting

"---------------------------------------------------------------
" Search
"---------------------------------------------------------------

set ignorecase      " Case insensitive search...
set smartcase       " ... except when using capital letters
set incsearch       " Highlight match while typing

" Turn off highlights in insert mode
autocmd InsertEnter * :setlocal nohlsearch

" Toggle search highlights
nnoremap <leader>/ :set hlsearch!<CR>

"---------------------------------------------------------------
" Formatting
"---------------------------------------------------------------

set expandtab       " Insert mode expands tabs to spaces
set shiftwidth=4    " # columns to indent with >> and <<
set softtabstop=-1  " Insert mode inserts 'shiftwidth' spaces
set autoindent      " Copy the indentation of the previous line

"---------------------------------------------------------------
" Motion
"---------------------------------------------------------------

" j/k move one display line instead of one logical line.
nnoremap j gj
nnoremap k gk

" Kill the arrow keys
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>

" Navigate to neighboring windows.
nnoremap <leader>h <c-w>h
nnoremap <leader>j <c-w>j
nnoremap <leader>k <c-w>k
nnoremap <leader>l <c-w>l
