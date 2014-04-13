set tabstop=4
set nu
set nocompatible
filetype plugin indent on

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'hallison/vim-markdown'
Bundle 'Raimondi/delimitMate'
Bundle 'SearchComplete'
Bundle 'jellybeans.vim'
Bundle 'vim-pencil'

let g:pencil#wrapModeDefault = 'soft'
let g:pencil#cursorwrap = 0
augroup pencil
  autocmd!
  autocmd FileType markdown call pencil#init()
  autocmd FileType textile call pencil#init()
  autocmd FileType text call pencil#init({'wrap': 'hard'})
augroup END

let mapleader = ","
set t_Co=256
set encoding=utf-8
set expandtab
set cursorline
set shiftwidth=2
set smarttab
set autoindent
set smartindent
set softtabstop=2
set nowrap

syntax enable 
color jellybeans

autocmd VimEnter,VimLeave * silent !tmux set status

nnoremap <silent> <leader>m :!make<CR>
