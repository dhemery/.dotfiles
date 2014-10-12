"---------------------------------------------------------------
" General settings
"---------------------------------------------------------------

" Make command completion show all options, not only first match
set wildmode=list:longest

" Enable the mouse in all modes
set mouse=a

" Allow backspace across indents, lines, start of insert
set backspace=indent,eol,start

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
set cursorline      " Highlight the line the cursor is on

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
nnoremap <leader>h :set hlsearch!<CR>

"---------------------------------------------------------------
" Indenting 
"---------------------------------------------------------------

set expandtab       " Insert mode expands tabs to spaces
set shiftwidth=4    " # columns to indent with >> and <<
set softtabstop=-1  " Insert mode inserts 'shiftwidth' spaces
set autoindent      " Copy the indentation of the previous line

