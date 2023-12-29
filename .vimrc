let mapleader = " "
let maplocalleader = " "

syntax on
colorscheme slate

set guicursor=

set background=dark

set number
set relativenumber

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set timeoutlen=500
set timeout

set nowrap

set noswapfile
set nobackup
set undodir=$HOME/.vim/undodir
set undofile

set nohlsearch
set incsearch
set termguicolors

set scrolloff=8

set signcolumn=yes
set isfname+=@-@
set updatetime=50

set colorcolumn=80

set spell
set spelllang=en_us

" key maps

" Disable mapping for Space in normal and visual modes
nnoremap <Space> <Nop>
vnoremap <Space> <Nop>

" Remap for dealing with word wrap
nnoremap <expr> k v:count == 0 ? 'gk' : 'k'
nnoremap <expr> j v:count == 0 ? 'gj' : 'j'

" Keymaps
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap J mzJ`z
nnoremap <leader>x :Ex<CR>
noremap <leader>y "+y
noremap <leader>p "+p
nnoremap <C-s> :w<CR>

" vim-plug
call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'
" Make sure you use single quotes

call plug#end()
