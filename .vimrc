"__________________________________________________________________________________________
" Vundle plugin Manager
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/Vundle.vim
call vundle#begin()
" Instal plugins straight into .vim please
call vundle#begin('~/.vim')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Personal .vim files
" Plugin 'bmcilw1/my.vim'

" Core
Plugin 'croaker/mustang-vim' " Love those colors
Plugin 'tpope/vim-surround' " Essential
Plugin 'kien/ctrlp.vim'

" Keepers
Plugin 'scrooloose/nerdtree' " replaced by fuzzy finder
Plugin 'tpope/vim-fugitive' " Git in vim
Plugin 'SirVer/ultisnips' " Python dependant
Plugin 'honza/vim-snippets' " Snippets are separated from the engine.
Plugin 'mattn/emmet-vim' " Snippets are separated from the engine.

" Experimental - to try
"Plugin 'justinmk/vim-sneak'
"Plugin 'rstacruz/sparkup' " html code expander... can it be done in Utilisnips?

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ
"__________________________________________________________________________________________

" TODO: Make a github repo for personalized snippets, manage it via vundle.
" Git push after updating a snippet
" Make seperate githup repo for spellcheck file, managed via vundle 

" My colors
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
endif
colors mustang
syntax enable
"let &t_Co=256

set shellcmdflag=-ic  " Make shell behave like my command prompt - load the rc's 
set ttyfast " improve buffer-update speed

"set hidden " I'm ok with hidden buffers. No warning flags plz

" Set indent = 4 spaces
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

augroup vimrc
  autocmd!
  au BufReadPre * setlocal foldmethod=indent
  "au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END

set noswapfile " Prevent vim from creating unwanted temp files - I got vcs

let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key='<C-y>'

let mapleader = " " " Set mapleader, backslash is the default 

inoremap ;; <esc>
 
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Show invisible characters, tab and new line
nnoremap <leader>l :set list!<CR> 
set listchars=tab:▸\ ,eol:¬

" Toggle highlighting on/off, and show current value.
nnoremap <leader>hl :set hlsearch! hlsearch?<CR>

nnoremap <leader>Q :q!<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>ww :w<CR>

" Deals with text wrapping
noremap <silent> <Leader>wr :call ToggleWrap()<CR>
function! ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    setlocal nowrap
    set virtualedit=all
    silent! nunmap <buffer> <Up>
    silent! nunmap <buffer> <Down>
    silent! nunmap <buffer> <Home>
    silent! nunmap <buffer> <End>
    silent! iunmap <buffer> <Up>
    silent! iunmap <buffer> <Down>
    silent! iunmap <buffer> <Home>
    silent! iunmap <buffer> <End>
    silent! iunmap <buffer> k
    silent! iunmap <buffer> j
    silent! iunmap <buffer> 0
    silent! iunmap <buffer> $

  else
    echo "Wrap ON"
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal display+=lastline
    noremap  <buffer> <silent> <Up>   gk
    noremap  <buffer> <silent> <Down> gj
    noremap  <buffer> <silent> <Home> g<Home>
    noremap  <buffer> <silent> <End>  g<End>
    inoremap <buffer> <silent> <Up>   <C-o>gk
    inoremap <buffer> <silent> <Down> <C-o>gj
    inoremap <buffer> <silent> <Home> <C-o>g<Home>
    inoremap <buffer> <silent> <End>  <C-o>g<End>
    noremap  <buffer> <silent> k gk
    noremap  <buffer> <silent> j gj
    noremap  <buffer> <silent> 0 g0
    noremap  <buffer> <silent> $ g$
    onoremap <silent> j gj
    onoremap <silent> k gk
  endif
endfunction
silent call ToggleWrap()
silent call ToggleWrap()

"set backspace=2 " Normal backspace

let g:ctrlp_show_hidden = 1
nnoremap <leader>pb :CtrlPBuffer<CR>
nnoremap <leader>pr :CtrlPMRU<CR>
nnoremap <leader>pp :CtrlP<CR>

setlocal spell! spelllang=en_us 
nnoremap <leader>sp :setlocal spell! spelllang=en_us spell?<CR>

let g:UltiSnipsExpandTrigger="<tab>" " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical" " If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsSnippetDir="~/.vim/myUltisnips"
nnoremap <leader>eu :UltiSnipsEdit!<CR>

set autochdir " Make currently opened file the current open directory on bash

"autocmd StdinReadPre * let s:std_in=1 " Start Nerdtree on startup UNLESS node is a directory -- Tiral - go fuzzy!
"autocmd VimEnter * if !exists("s:std_in") && (argc() == 0 || (argc() == 1 && !isdirectory("s:alist[1]"))) | NERDTree | wincmd p | endif 
nnoremap <leader>n :NERDTreeToggle<CR>

" Quit NERDTree if it is the last buffer open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
