"Basic settings
set tabstop=4
set nu
set nocompatible
filetype off

"Boilerplate to enable Vundle
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'gmarik/vundle' "Plugin Manager
Plugin 'kien/ctrlp.vim' "Fuzzy search directories
Plugin 'hallison/vim-markdown' "Markdown support
Plugin 'Raimondi/delimitMate' "Automatic bracket closing
Plugin 'SearchComplete' "Tab completion when searching files
Plugin 'jellybeans.vim' "Theme

"Heavier weight plugins below. Comment out if you don't need them.
Plugin 'bling/vim-airline' "Better statusline
Plugin 'scrooloose/syntastic' "Syntax checking. Unless your using VIM as a full on IDE with syntax checking, I would reccomend disabling this one, because it doesn't support multithreading and will freeze VIM when you save the file as it check the syntax.
Plugin 'jdonaldson/vaxe'      "Haxe support. Remove if you don't use it

call vundle#end()
filetype plugin indent on

"Makes airline show a bar at the top with all the open buffers
let g:airline#extensions#tabline#enabled = 1

let mapleader = "," "Change the leader key to ','

set t_Co=256 "MORE COLORS
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

"Rebind ',m' to run make
nnoremap <silent> <leader>m :make<CR>
"Rebind ',t' to open TagBar (disable if you disabled the plugin)
nnoremap <silent> <leader>t :TagbarToggle<CR>
