"Basic settings
set tabstop=4
set nu
set nocompatible
filetype off

"Boilerplate to enable Vundle
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'gmarik/Vundle.vim' "Plugin Manager
Plugin 'kien/ctrlp.vim' "Fuzzy search directories
Plugin 'tacahiroy/ctrlp-funky' "Ctrl-P extender to allow you to search functions in file.
Plugin 'scrooloose/nerdtree' "Directory listing
Plugin 'hallison/vim-markdown' "Markdown support
Plugin 'Raimondi/delimitMate' "Automatic bracket closing
Plugin 'SearchComplete' "Tab completion when searching files
Plugin 'airblade/vim-gitgutter' "Shows which lines have been added/modified/removed since last commit
Plugin 'flazz/vim-colorschemes' "THEMES!
Plugin 'Valloric/YouCompleteMe' "Autocomplete
Plugin 'mattn/emmet-vim' "Text expansion
Plugin 'bling/vim-airline' "Better statusline
Plugin 'tpope/vim-dispatch' "Friggin amazing build tool

call vundle#end()
filetype plugin indent on

"Makes airline show a bar at the top with all the open buffers
let g:airline#extensions#tabline#enabled = 1

"Ctrl-P configuration
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_extensions = ['funky', 'line']
let g:ctrlp_funky_syntax_highlight = 1

"Make gitgutter update in realtime
let g:gitgutter_realtime = 1

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
colorscheme jellybeans

set list
set listchars=tab:::,trail:.,extends:#,nbsp:.
set colorcolumn=+1
highlight clear SignColumn

"Rebind stuff
nnoremap <silent> <leader>m :Make<CR>
nnoremap <silent> <leader>f :CtrlPFunky<Cr>
nnoremap <silent> <leader>/ :CtrlPLine<Cr>
nnoremap <silent> <leader>F :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
nnoremap <silent> <leader>t :NERDTreeToggle<CR>
