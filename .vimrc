set tabstop=4
set nu
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'tpope/vim-fugitive'
Bundle 'ervandew/supertab'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'hallison/vim-markdown'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Raimondi/delimitMate'
Bundle 'thisivan/vim-taglist'
Bundle 'toggle_maximize.vim'

Bundle 'SearchComplete'
Bundle 'jellybeans.vim'

let mapleader = ","
set t_Co=256
set encoding=utf-8
set expandtab
set shiftwidth=2
set smarttab
set autoindent
set smartindent
set softtabstop=2
set nowrap

syntax enable 
color jellybeans

filetype plugin indent on

nnoremap <silent> <leader>t :TlistToggle<CR>
nnoremap <silent> <leader>n :NERDTreeToggle<CR>
nnoremap <silent> <leader>m :!make<CR>
