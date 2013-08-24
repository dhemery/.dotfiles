runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

"---------------------------------------------------------------
" General settings
"---------------------------------------------------------------

set nocompatible

" Make it easier to switch between files
set hidden

" Make <TAB> show all options, not only first match
set wildmenu
set wildmode=list:longest

" Enable the user of the mouse for all modes
set mouse=a

" Keep a longer history
set history=1000

" Allow backspace across indents, lines
set backspace=indent,eol,start

" Quickly time out on keycodes, but never on mappings
set notimeout ttimeout ttimeoutlen=200

set modeline
set modelines=3

"---------------------------------------------------------------
" Display
"---------------------------------------------------------------

" Set the terminal window's title
set title

" Display line numbers
set number

" Always display the status line
set laststatus=2

" Display partial commands at bottom of screen
set showcmd

" Display cursor position at bottom of screen
set ruler

" Set the command window to 2 lines, to avoid having to press
" <enter> to continue
set cmdheight=2

" Visual bell instead of beeping ...
set visualbell

" ... and turn off the bell altogether
set t_vb=

" Ask to save instead of failing
set confirm

" Maintain more context around the cursor when scrolling
set scrolloff=3

" Consider tabs, trailing space, eol as invisible characters
set listchars=tab:>-,trail:·,eol:$

" Gently highlight the current line and column
set cursorline
set cursorcolumn

"---------------------------------------------------------------
" Colors
"---------------------------------------------------------------

" Enable syntax highlighting
syntax on
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" Determine file type.
" - indent: allow intelligent autoindenting by filetype
" - plugin: allow filetype-specific plugins
filetype indent plugin on

"---------------------------------------------------------------
" Searching
"---------------------------------------------------------------
" Highlight search terms ...
set hlsearch
" ... while typing
set incsearch

" Turn off highlights in insert mode
autocmd InsertEnter * :setlocal nohlsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

"---------------------------------------------------------------
" Indenting
"---------------------------------------------------------------

set shiftwidth=4
set softtabstop=4
set expandtab

set autoindent

" Stop certain movements from going to first character of line
set nostartofline

"--------------------------------------------------------------
" Key mapping
"--------------------------------------------------------------

" Use comma as leader
let mapleader = ","

" ,s
" show/hide invisible characters
nmap <silent> <leader>s :set list!

" ,md
" convert markdown contents to HTML and open in browser
" (requires the bcat gem to be installed)
nmap <leader>md :silent !open -a Marked.app '%:p'<cr>

" ,ad
" convert ASCIIDoc contents to HTML and open in browser
" (requires the bcat gem to be installed)
nmap <leader>ad :silent !asciidoc -o - '%:p' \| bcat &<cr> \| :redraw!<cr>


" <F11>
" toggle paste / nopaste
set pastetoggle=<F11>

" Swap ` and ' to make it easier to get to marked column
nnoremap ` '
nnoremap ' `

" <F1> Because my damned fat fingers hit <F1> when I reach for <Esc>
map <F1> <Esc>

" Make Y yank to end of line
map Y y$

" Make % key recognize more opening/closing pairs
runtime macros/matchit.vim

" Make <C-e> and <C-y> scroll more lines
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

autocmd BufNewFile,BufRead *.markdown,*.md,*.mdown,*.mkd,*.mkdn
      \ if &ft =~# '^\%(conf\|modula2\)$' |
      \   set ft=markdown |
      \ else |
      \   setf markdown |
      \ endif

autocmd BufNewFile,BufRead *.ad,*.asciidoc,*.adoc
      \ setlocal filetype=asciidoc

let g:surround_{char2nr('c')} = "`\r`"
let g:surround_{char2nr('o')} = "**\r**"
let g:surround_{char2nr('i')} = "_\r_"

nnoremap <leader>h :set hlsearch!<CR>

inoremap <F1> <Esc>
