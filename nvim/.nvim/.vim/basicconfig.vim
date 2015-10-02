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
set modeline
set modelines=5
set number expandtab smarttab autoindent smartindent hidden nowrap nobackup
set path=$PWD/**
syntax enable

"Configure file browser
let g:netrw_browse_split = 0

"Strip trailing whitespace when writing a file
autocmd BufWritePre * :%s/\s\+$//e

"Move windows with A-Direction
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <leader>b :CtrlPBuffer<CR>
nnoremap <silent> <leader>o :CtrlP<CR>
nnoremap <silent> <leader>t :NERDTreeToggle<CR>
nnoremap <silent> <leader>m :make<CR>
nnoremap <silent> <leader>d :Ack <C-R><C-W><CR>
vnoremap . :norm.<CR>
