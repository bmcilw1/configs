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

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo

"Ultisnips if python is available
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets' " Snippets are separated from the engine.
Plugin 'croaker/mustang-vim' "Love those colors
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'joonty/vdebug'

"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"__________________________________________________________________________________________

" My colors
colors mustang
let &t_Co=256
syntax enable
" Make shell behave like my command prompt - load the rc's 
set shellcmdflag=-ic  
" improve buffer-update speed
set ttyfast
" I'm ok with hidden buffers. No warning flags plz
set hidden
" Set mapleader, backslash is the default 
"let mapleader = '\\'
" Show invisiable characters, tab and new line
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬
set hlsearch

" Set indent = 4 spaces
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" Normal backspace
set backspace=2

" CtrlP configuration
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Ultisnipps config

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Make currently opened file the current open directory on bash
set autochdir

" Start Nerdtree on startup UNLESS node is a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if !exists("s:std_in") && (argc() == 0 || (argc() == 1 && !isdirectory("s:alist[1]"))) | NERDTree | wincmd p | endif

" Quit NERDTree if it is the last buffer open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
