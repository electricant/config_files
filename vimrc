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
colors pablo

" Indentation and tab beahviour (indent using tabs instaed of spaces)
set noexpandtab
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=4
set tabstop=4
set ai             " Auto indent
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
set textwidth=80 "gq at the beginning wraps automatically

" Competion settings
set complete=.,w,b,u,t,i,kspell

" Hilight search results
set hlsearch

" Show matching brackets when text indicator is over them
set showmatch

" put vim in paste mode using F2
set pastetoggle=<F2>

" Quick toggle spell check
map <F3>i :set spell! spelllang=it<CR>
map <F3>e :set spell! spelllang=en<CR>
map <F4> :set spell!<CR>
map <F5> :SyntasticToggleMode<CR>

" remap '.' as ':' when in normal mode and vice versa (put here due to
" function keys remaps not working)
nnoremap . :
nnoremap : .

" syntastic
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=0
let g:syntastic_warning_symbol='W>'
let g:syntastic_c_compiler_options='-Wall -Wpedantic -Wextra'
let g:syntastic_cpp_compiler_options='-Wall -Wpedantic -Wextra -std=c++11'
let g:syntastic_d_compiler='gdc'
let g:syntastic_d_compiler_options='-Wall'

" Remove arrow keys in order to be forced to use hjkl
nnoremap <Left> :echo "No left for you!"<CR>
vnoremap <Left> :<C-u>echo "No left for you!"<CR>
inoremap <Left> <C-o>:echo "No left for you!"<CR>

nnoremap <Right> :echo "No right for you!"<CR>
vnoremap <Right> :<C-u>echo "No right for you!"<CR>
inoremap <Right> <C-o>:echo "No right for you!"<CR>

nnoremap <Up> :echo "No up for you!"<CR>
vnoremap <Up> :<C-u>echo "No up for you!"<CR>
inoremap <Up> <C-o>:echo "No up for you!"<CR>

nnoremap <Down> :echo "No down for you!"<CR>
vnoremap <Down> :<C-u>echo "No down for you!"<CR>
inoremap <Down> <C-o>:echo "No down you!"<CR>






