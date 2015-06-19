"""""""""""""""""""""""
" BASIC CONFIGURATION "
"""""""""""""""""""""""
let mapleader = ","

set encoding=utf-8
set fenc=utf-8
set termencoding=utf-8
set backspace=2
set laststatus=1
set shiftwidth=4
set tabstop=4
set number expandtab smarttab autoindent smartindent hidden nowrap nobackup
set path=$PWD/**
syntax enable

"Configure file browser
let g:netrw_browse_split = 0

"Strip trailing whitespace when writing a file
autocmd BufWritePre * :%s/\s\+$//e

"Move windows with C-Direction
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <leader>b :CtrlPBuffer<CR>
nnoremap <silent> <leader>o :CtrlP<CR>
nnoremap <silent> <leader>t :NERDTree<CR>
nnoremap <silent> <leader>m :make<CR>
nnoremap <silent> <leader>d :Ack <C-R><C-W><CR>
