" Brian McIlwain
" .vimrc

" Plugins by vim-plug
call plug#begin('~/.vim/bundle')

" Personal .vim files
" Plug 'bmcilw1/my.vim'

" Core
Plug 'bmcilw1/mustang-vim'
Plug 'tpope/vim-surround' " Essential
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired' " For navigating quickfix
Plug 'kien/ctrlp.vim', { 'on': 'CtrlP' } " Go fuzzy

" Keepers
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " mostly replaced by fuzzy finder

" Also use nerdtree if opening a directory
augroup nerd_loader
  autocmd!
  autocmd VimEnter * silent! autocmd! FileExplorer
  autocmd BufEnter,BufNew *
        \  if isdirectory(expand('<amatch>'))
        \|   call plug#load('nerdtree')
        \|   execute 'autocmd! nerd_loader'
        \| endif
augroup END

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets' " Python dependant
"Plug 'mattn/emmet-vim' " html/css parser engine - this or snippets?

" Experimental - to try
"Plug 'justinmk/vim-sneak'
"Plug 'gregsexton/gitv'
"Plug 'tpope/vim-commentary' " which to use?
"Plug 'tomtom/tcomment_vim'

call plug#end()

" TODO: Make a github repo for personalized snippets, manage it via package
" mangager
" Git push after updating a snippet
" Make seperate github repo for spellcheck file, managed via vundle 

" My colors
colors mustang
syntax enable

set shellcmdflag=-ic  " Make shell behave like my command prompt - load the rc's 
set hidden " I'm ok with hidden buffers. No warning flags please

" more natural splits
set splitbelow
set splitright

" Set indent = 4 spaces
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set ff=unix

" Folding
" augroup vimrc
"   autocmd!
"   au BufReadPre * setlocal foldmethod=indent
"   "au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
" augroup END

set noswapfile " Prevent vim from creating unwanted temp files - I got vcs

let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key='<C-y>'

let mapleader = " " " Set mapleader, backslash is the default 

set timeoutlen=350 ttimeoutlen=0 "Timeout for waiting for multiple keys for bindings
inoremap ;; <esc>
 
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Show invisible characters, tab and new line
nnoremap <leader>l :set list!<CR> 
set listchars=tab:▸\ ,eol:¬

set lazyredraw " stop vim redraw during complex operations

" Toggle highlighting on/off, and show current value.
nnoremap <leader>hl :set hlsearch! hlsearch?<CR>

" File tasks
nnoremap <leader>Q :q!<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>h :hide<CR>

"set backspace=2 " Normal backspace

let g:ctrlp_show_hidden = 1
nnoremap <leader>pb :CtrlPBuffer<CR>
nnoremap <leader>pr :CtrlPMRU<CR>
nnoremap <leader>pp :CtrlP<CR>

setlocal spell! spelllang=en_us "How two spel?

let g:UltiSnipsExpandTrigger="<tab>" " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical" " If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsSnippetDir="~/.vim/myUltisnips"
nnoremap <leader>eu :UltiSnipsEdit!<CR>

set autochdir " Make currently opened file the current open directory on bash

"autocmd StdinReadPre * let s:std_in=1 " Start Nerdtree on startup UNLESS node is a directory -- Tiral - go fuzzy!
"autocmd VimEnter * if !exists("s:std_in") && (argc() == 0 || (argc() == 1 && !isdirectory("s:alist[1]"))) | NERDTree | wincmd p | endif 
nnoremap <leader>n :NERDTreeToggle<CR>

" Quit NERDTree if it is the last buffer open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
