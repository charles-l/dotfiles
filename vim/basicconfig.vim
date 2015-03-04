"""""""""""""""""""""""
" BASIC CONFIGURATION "
"""""""""""""""""""""""
let mapleader = ","

set t_Co=256 "MORE COLORS
set encoding=utf-8
set fenc=utf-8
set termencoding=utf-8
set backspace=2
set laststatus=1
set tags=./tags
set shiftwidth=2
set tabstop=4
set number expandtab smarttab autoindent smartindent hidden nowrap relativenumber
set path=$PWD/**

autocmd BufNewfile,BufRead *.go setf go

"Configure file browser
let g:netrw_browse_split = 0

"Strip trailing whitespace when writing a file
autocmd BufWritePre * :%s/\s\+$//e

""""""""ANNOYANCES""""""""
" Don't jump when I merge lines
nnoremap J mzJ`z
nnoremap n nzz
nnoremap } }zz
" Don't jump over wrapped lines
nnoremap j gj
nnoremap k gk
" Remove commonly bumped commands
nnoremap <F1> <nop>
nnoremap Q <nop>
nnoremap K <nop>
" Short startup messages
set shortmess+=I
set showmode
set smartcase
" Global search by default
set gdefault
set virtualedit=block
set wildmode=longest,list
nnoremap Y y$
" Don't tab complete binary files
set wildignore+=*.a,*.o
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
set wildignore+=.DS_Store,.git,.hg,.svn
set wildignore+=*~,*.swp,*.tmp
set shellpipe=2> "otherwise, vim throws out compiler error messages >:(
" Remove useless backup files
set nobackup nowritebackup
" Very rarely does anyone need swap files anymore
set noswapfile
" Minor highlight tweaks
highlight Pmenu ctermbg=DarkGrey ctermfg=White

