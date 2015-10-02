"""""""""""""""""""""""
" BASIC CONFIGURATION "
"""""""""""""""""""""""
let mapleader = ","

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

"Move windows with C-Direction
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
tnoremap <Esc> <C-\><C-n>
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
inoremap <C-F> <C-X><C-F>

nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <leader>b :CtrlPBuffer<CR>
nnoremap <silent> <leader>o :CtrlP<CR>
nnoremap <silent> <leader>t :NERDTreeToggle<CR>
nnoremap <silent> <leader>m :term make<CR>
nnoremap <silent> <leader>d :Ack <C-R><C-W><CR>
nnoremap <silent> <leader>s :Scratch<CR>

nnoremap <leader>r yyp!!sh<CR>
vnoremap <leader>r yo<ESC>p!!sh<CR>

vnoremap . :norm.<CR>
