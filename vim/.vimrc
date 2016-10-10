set nocompatible
filetype plugin indent on

call plug#begin('~/.vim/plugged')

Plug 'kana/vim-fakeclip'
Plug 'tpope/vim-fugitive' "Git wrapper
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'vim-indent-object'
Plug 'textobj-user'
Plug 'matchit.zip'
Plug 'Raimondi/delimitMate'
Plug 'vimwiki'
let g:vimwiki_list = [{'syntax': 'markdown', 'ext': '.md'}]
Plug 'jlanzarotta/bufexplorer'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Lisp
Plug 'sjl/tslime.vim'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'

" C
Plug 'scrooloose/syntastic'
Plug 'FSwitch'

call plug#end()

"""

let mapleader = ","

set backspace=2
set laststatus=1
set shiftwidth=4
set tabstop=4
set modeline
set modelines=5
set nonumber expandtab smarttab autoindent smartindent hidden nowrap nobackup
set path=$PWD/**
set path+=/usr/include/**
syntax enable
let g:netrw_browse_split = 0

"Strip trailing whitespace when writing a file
au BufWritePre * :%s/\s\+$//e

"Move windows with C-Direction
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <leader>o :FZF<CR>
nnoremap <silent> <leader>a :FSHere<CR>

nnoremap <leader>r yyp!!sh<CR>
vnoremap . :norm.<CR>

" chicken scheme stuff.
au filetype scheme call SetSchemeOptions()
function SetSchemeOptions()
    let b:delimitMate_quotes = "\""
    setl include=\^\(\\(use\\\|require-extension\\)\\s\\+
    setl includeexpr=substitute(v:fname,'$','.scm','')
    setl path+=/usr/local/lib/chicken/8/
    setl suffixesadd+=.scm
    setl lispwords+=handle-exceptions,call/cc,rec,receive
    nmap <silent> == :call Scheme_indent_top_sexp()<cr>
    let b:is_chicken=1

    " Indent a toplevel sexp.
    fun! Scheme_indent_top_sexp()
        let pos = getpos('.')
        silent! exec "normal! 99[(=%"
        call setpos('.', pos)
    endfun
endfunction

set background=light
colorscheme delek
