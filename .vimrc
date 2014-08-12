"Basic settings
set tabstop=4
set nu
set nocp
set nocompatible
filetype off

"Boilerplate to enable Vundle
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'gmarik/Vundle.vim' "Plugin Manager
Plugin 'kien/ctrlp.vim' "Fuzzy search directories
Plugin 'tacahiroy/ctrlp-funky' "Ctrl-P extender to allow you to search functions in file.
Plugin 'taglist.vim' "Source code browser
Plugin 'scrooloose/nerdtree' "Directory listing
Plugin 'hallison/vim-markdown' "Markdown support
Plugin 'Raimondi/delimitMate' "Automatic bracket closing
Plugin 'SearchComplete' "Tab completion when searching files
Plugin 'flazz/vim-colorschemes' "THEMES!
Plugin 'bling/vim-airline' "Better statusline
Plugin 'tpope/vim-dispatch' "Friggin amazing build plugin
Plugin 'tpope/vim-surround' "Surrounding motions
Plugin 'tpope/vim-endwise' "Smart if/do/def/end completion
Plugin 'tpope/vim-fugitive' "Git wrapper
Plugin 'tpope/vim-obsession' "Save the session
Plugin 'christoomey/vim-tmux-navigator' "Tmux/Vim integration
Plugin 'epeli/slimux' "Inline REPL
Plugin 'scrooloose/syntastic' "Syntax checking
Plugin 'AutoTag' "Ctags
Plugin 'OmniCppComplete' "Cpp/C ctags C! C the ctags! C and Cpp Ctags C the C!
Plugin 'AutoComplPop' "Autocomplete popup

call vundle#end()
filetype plugin indent on

"Airline configuration
let g:airline_left_sep = ''
let g:airline_right_sep = ''

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#right_sep = ''

"Ctrl-P configuration
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_extensions = ['funky', 'line']
let g:ctrlp_funky_syntax_highlight = 1

"DelimitMate settings
let delimitMate_matchpairs = "(:),[:],{:}"
au FileType html,xml,erb = "(:),[:],{:},<:>"

let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1
let delimitMateBackspace = 1

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
set scrolljump=5
set backspace=2
set laststatus=2

"I never found the backup files useful.
set nobackup
set nowritebackup
inoremap <C-U> <C-G>u<C-U>

syntax enable
colorscheme jellybeans

set colorcolumn=+1
highlight clear SignColumn

"Bind stuff
nnoremap <silent> <leader>m :Make<CR>
nnoremap <silent> <leader>T :TlistToggle<CR>
nnoremap <silent> <leader>f :CtrlPFunky<Cr>
nnoremap <silent> <leader>F :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
nnoremap <silent> <leader>/ :CtrlPLine<Cr>
nnoremap <silent> <leader>t :NERDTreeToggle<CR>

vmap <silent> <leader>r :SlimuxREPLSendSelection<CR>

"Move windows with C-Direction
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l
