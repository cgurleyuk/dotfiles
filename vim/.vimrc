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

if has('win32') || has('win64')
    set rtp+=$HOME/vimfiles/bundle/Vundle.vim
    call vundle#begin('$HOME/vimfiles/bundle')
else
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
endif
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
if !has('win32')
    Plugin 'JuliaEditorSupport/julia-vim'
    Plugin 'scrooloose/syntastic'
endif
call vundle#end()

filetype plugin indent on

set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized

set enc=utf-8

" syntax
syntax enable

" syntastic
if !has('win32')
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 0
    let g:syntastic_check_on_wq = 0

    let g:syntastic_julia_checkers = ['lint']

    let g:syntastic_mode_map = {'mode': 'passive', 'active_filetypes': ['python'], 'passive_filetypes': ['julia']}
endif

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

nnoremap <C-n> :NERDTree<CR>

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
