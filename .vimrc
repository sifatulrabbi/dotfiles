" Set leader keys
let mapleader = " "
let maplocalleader = " "

" GUI cursor options (might not be applicable in Vim)
set guicursor=

" Line numbering
set number
set relativenumber

" Tab and indent settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Key timeout
set timeoutlen=500
set timeout

" Text wrapping
set wrap

" Swap file, backup, and undo settings
set noswapfile
set nobackup
set undodir=$HOME/.vim/undodir
set undofile

" Search settings
set nohlsearch
set incsearch
set termguicolors

" Scrolling off
set scrolloff=8

" Sign column
set signcolumn=yes

" File name settings
set isfname+=@-@

" Update time for swap file
set updatetime=50

" Color column
set colorcolumn=80

" Clipboard settings
set clipboard=unnamedplus

" Spell checking
set spell
set spelllang=en_us

" Conceal settings
setlocal conceallevel=0
