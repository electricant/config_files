" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim

" Remap a few keys for Windows behavior
source $VIMRUNTIME/mswin.vim

" Mouse behavior (the Unix way)
behave xterm

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

" vimrc from https://github.com/electricant/config_files/blob/master/vimrc
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
set scrolloff=6

" Syntax and colors
syntax on
colors darkblue

" Appearance settings for gVim
if has("gui_running")
	set guifont=Consolas:h11
	" Set sensible initial window size
	set lines=40 columns=80
	colorscheme desert
endif

" Indent with tabs, align with spaces
set noexpandtab
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=6
set tabstop=6

" Search tweaks
set ignorecase
set smartcase
set incsearch
set hlsearch " Hilight search results

" Turn magic on for regex
set magic

" Linebreak settings
set linebreak
let &showbreak = '> '
set textwidth=80 "gq at the beginning wraps automatically
"set formatoptions+=a
nnoremap wp gq}

" Competion settings
set complete=.,w,b,u,t,i,kspell

" Show matching brackets when text indicator is over them
set showmatch

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" put vim in paste mode using F2
set pastetoggle=<F2>

" Quick toggle spell check
map <F3>i :set spell! spelllang=it<CR>
map <F3>e :set spell! spelllang=en<CR>
map <F4> :set spell!<CR>
map <F5> :SyntasticToggleMode<CR>
map <F6> :w \| :make!<CR>

" remap '.' as ':' when in normal mode and ',' to '.' 
nnoremap . :
nnoremap , .

" syntastic plugin options
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=1
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_jump=2
let g:syntastic_warning_symbol="W>"
let g:syntastic_error_symbol="E>"

let g:syntastic_c_compiler_options='-Wall -Wpedantic -Wextra'
let g:syntastic_cpp_compiler_options='-Wall -Wpedantic -Wextra -std=c++11'
let g:syntastic_d_compiler='gdc'
let g:syntastic_d_compiler_options='-Wall'
let g:syntastic_tex_checkers=['lacheck'] " ChkTeX is too strict and chatty

" vim-lastplace plugin (default settings)
let g:lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit"
let g:lastplace_ignore_buftype = "quickfix,nofile,help"

" Remove arrow keys in order to be forced to use hjkl
nnoremap <Left> :echo "No left for you!"<CR>
vnoremap <Left> :<C-u>echo "No left for you!"<CR>
"inoremap <Left> <C-o>:echo "No left for you!"<CR>

nnoremap <Right> :echo "No right for you!"<CR>
vnoremap <Right> :<C-u>echo "No right for you!"<CR>
"inoremap <Right> <C-o>:echo "No right for you!"<CR>

nnoremap <Up> :echo "No up for you!"<CR>
vnoremap <Up> :<C-u>echo "No up for you!"<CR>
"inoremap <Up> <C-o>:echo "No up for you!"<CR>

nnoremap <Down> :echo "No down for you!"<CR>
vnoremap <Down> :<C-u>echo "No down for you!"<CR>
"inoremap <Down> <C-o>:echo "No down you!"<CR>

" This clears search higliting by hitting return
nnoremap <CR> :noh<CR><CR>

" UltiSnips settings (installed from Debian repositories)
set runtimepath+=/usr/share/vim/vim-ultisnips " where's the plugin located?
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'

" Remove backup files from the working directory and put them into %TEMP%
" https://vim.fandom.com/wiki/Remove_swap_and_backup_files_from_your_working_directory
" https://stackoverflow.com/questions/607435/why-does-vim-save-files-with-a-extension
"
" Swap files can stay where they are as they mostly go unnoticed
set backupdir=%TEMP%,.

" Remove undo files from the working durectory and put them into %TEMP%
" https://stackoverflow.com/questions/15660669/what-is-a-un-file-or-or-why-does-vim-in-the-terminal-make-the-un-file
set undodir=%TEMP%,.

" Reload .vimrc automagically if something is changed
if has ('autocmd') " Remain compatible with earlier versions
	augroup vimrc
		au!
    	au! BufWritePost $MYVIMRC so % | echom "Reloaded " . $MYVIMRC 
  augroup END
endif
