" Brian McIlwain
" .vimrc

" vim-plug auto setup
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins by vim-plug
call plug#begin('~/.vim/bundle')

" Core
Plug 'bmcilw1/mustang-vim'
Plug 'tpope/vim-surround' " Essential
Plug 'tpope/vim-fugitive' " Awesome git wrapper
Plug 'tpope/vim-unimpaired' " For navigating quickfix
Plug 'xolox/vim-misc' " Dependency to vim-session
Plug 'xolox/vim-session' " Save my vim sessions

" Keepers
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " mostly replaced by fuzzy finder
Plug 'ap/vim-css-color' " Show color codes as color
Plug 'dbakker/vim-projectroot' "get project directory
Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' } " Go fuzzy
"Plug 'cosminadrianpopescu/vim-sql-workbench' " Sql interface
Plug 'vim-scripts/dbext.vim' " Sql interface

if has('python')
    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets' " Python dependant
endif

" Experimental - to try
"Plug 'justinmk/vim-sneak'
"Plug 'gregsexton/gitv'
"Plug 'tpope/vim-commentary' " which to use?
"Plug 'tomtom/tcomment_vim'
"Plug 'mattn/emmet-vim' " html/css parser engine - this or snippets?
call plug#end()

" ----------- The Look ------------------------
" My colors
colors mustang
syntax enable

" Gui
set guifont=Lucida_Console:h11
au GUIEnter * simalt ~x " gui full screen please
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" TODO: check on win
scriptencoding utf-8
set encoding=utf-8

" ----------- The Feel ------------------------
" more natural splits
set splitbelow
set splitright

" Set indent = 4 spaces
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" ----------- Fix Vim defaults ------------------------
set spelllang=en_us "How two spel?
set hidden " I'm OK with hidden buffers. No warning flags please
set noswapfile " Prevent vim from creating unwanted temp files - I got vcs
set autochdir " Make currently opened file the current open directory on bash
set lazyredraw " stop vim redraw during complex operations

"if has('win32')
"    set shell=powershell.exe
"endif
if has('unix')
    set shellcmdflag=-ic  " Make shell behave like my command prompt - load the rc's 
    set ff=unix " Unix line endings on unix
endif

" ----------- Custom shortcuts ------------------------
let mapleader = " " " Set mapleader, backslash is the default 

" Alternate escape
set timeoutlen=350 ttimeoutlen=0 "Timeout for waiting for multiple keys for bindings
inoremap ;; <esc> 

" Toggle highlighting on/off, and show current value.
nnoremap <leader>hl :set hlsearch! hlsearch?<CR>

" Spelling
nnoremap <leader>sp :set spell!<CR>

" File tasks
nnoremap <leader>Q :q!<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>h :hide<CR>
nnoremap <leader>bd :bd<CR>

" Constant vimrc access
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Show invisible characters, tab and new line
nnoremap <leader>l :set list!<CR> 
set listchars=tab:▸\ ,eol:¬

" Build and run project
autocmd BufEnter * nnoremap <buffer> <silent> <F3> :call <SID>f3()<CR>
autocmd BufEnter * nnoremap <buffer> <silent> <F4> :call <SID>f4()<CR>
autocmd BufEnter * nnoremap <buffer> <silent> <F5> :call <SID>f5()<CR>

function! s:f3()
    if expand('%:e') == 'cs'
       ProjectRootExe !msbuild /t:Rebuild
    endif
endfunction
function! s:f4()
    if expand('%:e') == 'cs' || expand('%:e') == 'sql'
       ProjectRootExe !msbuild
    endif
endfunction
function! s:f5()
    if expand('%:e') == 'cs'
    " TODO: get the path of build from msbuild
       ProjectRootExe !OutlookCRM\bin\Datafiche.exe
    elseif expand('%:e') == 'py'
       ProjectRootExe !python %
    endif
endfunction

" Folding
" augroup vimrc
"   autocmd!
"   au BufReadPre * setlocal foldmethod=indent
"   "au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
" augroup END

" ----------- Plugin settings ------------------------
" Ctrl-P
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = 'ra'
nnoremap <leader>p :CtrlP<CR>

" Utilisnips
let g:UltiSnipsExpandTrigger="<tab>" " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical" " If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsSnippetDir="~/.vim/myUltisnips"
nnoremap <leader>eu :UltiSnipsEdit!<CR>

" Nerdtree
nnoremap <leader>n :NERDTreeToggle<CR>

" Use nerdtree if opening a directory
augroup nerd_loader
  autocmd!
  autocmd VimEnter * silent! autocmd! FileExplorer
  autocmd BufEnter,BufNew *
        \  if isdirectory(expand('<amatch>'))
        \|   call plug#load('nerdtree')
        \|   execute 'autocmd! nerd_loader'
        \| endif
augroup END

" Quit NERDTree if it is the last buffer open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Vim-Session
set sessionoptions-=help " Don't save help files

" Auto-restore last closed session
let g:session_autoload='yes'
let g:session_autosave='yes'
let g:session_verbose_messages=0

" Sql Editor
let g:dbext_default_profile_mySqlServer = 'type=SQLSRV:integratedlogin=1:srvname=localhost\SQLEXPRESS:dbname=Datafiche2016v2_DEV'
let g:dbext_default_profile='mySqlServer'
