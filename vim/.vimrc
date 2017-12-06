set nocompatible
filetype off

if has("win32")
    set backspace=2
"    set rtp+=~/vundle.vim
endif

" do not use backup files
set nobackup
set nowritebackup
set noswapfile

" expand tabs to spaces
set tabstop=4
set shiftwidth=4
set expandtab

" show line numbers
set number
set numberwidth=5
set relativenumber

" set default splitting behavior
set splitbelow
set splitright

set hlsearch
set smartindent

set rtp+=~/.vim/bundle/vundle.vim
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'JuliaEditorSupport/julia-vim'
    Plugin 'scrooloose/nerdtree'
call vundle#end()
filetype plugin indent on

set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized

set enc=utf-8

" syntax
syntax enable

" tab command remaps
nnoremap th :tabfirst<CR>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap tl :tablast<CR>
nnoremap tt :tabedit<Space>
nnoremap tn :tabnext<Space>
nnoremap tm :tabm<Space>

nnoremap bk :bn<CR>
nnoremap bj :bp<CR>

" gvim settings
if has("gui_running")
    " turn off the menu and the toolbar
    set go-=m
    set go-=T

    " set fonts
    if has("gui_win32")
        set guifont=Consolas:h11
    endif
endif
