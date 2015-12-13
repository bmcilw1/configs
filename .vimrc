"__________________________________________________________________________________________
" Vundle plugin Manager
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Core
Plugin 'croaker/mustang-vim' " Love those colors
Plugin 'tpope/vim-surround' " Essential
Plugin 'kien/ctrlp.vim'

" Keepers
Plugin 'scrooloose/nerdtree' " replaced by fuzzy finder
Plugin 'tpope/vim-fugitive' " Git in vim
Plugin 'SirVer/ultisnips' " Python dependant
Plugin 'honza/vim-snippets' " Snippets are separated from the engine.

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

" My colors
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
endif
colors mustang
syntax enable
"let &t_Co=256

set shellcmdflag=-ic  " Make shell behave like my command prompt - load the rc's 
set ttyfast " improve buffer-update speed

set hidden " I'm ok with hidden buffers. No warning flags plz

let mapleader = " " " Set mapleader, backslash is the default 

" Show invisiable characters, tab and new line
nmap <leader>l :set list!<CR> 
set listchars=tab:▸\ ,eol:¬

" Toggle highlighting on/off, and show current value.
set hlsearch
noremap <leader>s :set hlsearch! hlsearch?<CR>

" Set indent = 4 spaces
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

"set backspace=2 " Normal backspace

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_show_hidden = 1

let g:UltiSnipsExpandTrigger="<tab>" " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical" " If you want :UltiSnipsEdit to split your window.

set autochdir " Make currently opened file the current open directory on bash

"autocmd StdinReadPre * let s:std_in=1 " Start Nerdtree on startup UNLESS node is a directory -- Tiral - go fuzzy!
"autocmd VimEnter * if !exists("s:std_in") && (argc() == 0 || (argc() == 1 && !isdirectory("s:alist[1]"))) | NERDTree | wincmd p | endif 
nmap <leader>n :NERDTreeToggle<CR>

" Quit NERDTree if it is the last buffer open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
