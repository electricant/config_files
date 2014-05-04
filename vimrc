" Syntax and colors
syntax on
colors desert

" Indentation and tab beahviour (indent using tabs instaed of spaces)
set smartindent
set noexpandtab
set softtabstop=0
set shiftwidth=6
set tabstop=6
set ai " Auto indent

" Linebreak settings
set linebreak
let &showbreak = '↳ '

" Hilight search results
set hlsearch

" Show matching brackets when text indicator is over them
set showmatch

" remap '.' as ':' when in normal mode
nnoremap . :

" syntastic
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=0
let g:syntastic_warning_symbol='W>'
let g:syntastic_c_compiler_options='-Wall -Wpedantic -Wextra'
let g:syntastic_cpp_compiler_options='-Wall -Wpedantic -Wextra -std=c++11'
let g:syntastic_d_compiler='gdc'
let g:syntastic_d_compiler_options='-Wall'

