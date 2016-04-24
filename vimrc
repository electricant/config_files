" general behaviour
set nocompatible
set encoding=utf8
set ttyfast

filetype on
filetype indent on
filetype plugin on

set autoread
set modeline

" Keep cursor 8 lines from window borders when scrolling
set scrolloff=8

" Syntax and colors
syntax on
colors desert

" Indentation and tab beahviour (indent using tabs instaed of spaces)
set noexpandtab
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=4
set tabstop=4
set ai " Auto indent
set smarttab
set smartindent

" Search tweaks
set ignorecase
set smartcase
set incsearch

" Turn magic on for regex
set magic

" Linebreak settings
set linebreak
let &showbreak = '↳ '
set tw=80 "gq at the beginning wraps automatically

" Hilight search results
set hlsearch

" Show matching brackets when text indicator is over them
set showmatch

" remap '.' as ':' when in normal mode
nnoremap . :

" put vim in paste mode using F2
set pastetoggle=<F2>

" Quick toggle spell check
map <F3>i :set spell! spelllang=it<CR>
map <F3>e :set spell! spelllang=en<CR>
map <F4> :set spell!<CR>

" syntastic
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=0
let g:syntastic_warning_symbol='W>'
let g:syntastic_c_compiler_options='-Wall -Wpedantic -Wextra'
let g:syntastic_cpp_compiler_options='-Wall -Wpedantic -Wextra -std=c++11'
let g:syntastic_d_compiler='gdc'
let g:syntastic_d_compiler_options='-Wall'

