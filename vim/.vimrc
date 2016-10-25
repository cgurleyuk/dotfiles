set nocompatible
set nobackup
set nowritebackup
set noswapfile

set tabstop=4
set shiftwidth=4
set expandtab

set number
set numberwidth=5

set splitbelow
set splitright

nnoremap th :tabfirst<CR>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap tl :tablast<CR>
nnoremap tt :tabedit<Space>
nnoremap tn :tabnext<Space>
nnoremap tm :tabm<Space>

syntax enable
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized
