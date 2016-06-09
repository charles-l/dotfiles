"Basic settings
set nocompatible
filetype plugin indent on

"""""""""""
" PLUGINS "
"""""""""""
call plug#begin('~/.vim/plugged')

Plug 'junegunn/rainbow_parentheses.vim' "Makes working with lisp easier
Plug 'junegunn/vim-oblique'
Plug 'junegunn/vim-pseudocl'
Plug 'kana/vim-fakeclip'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'tpope/vim-fugitive' "Git wrapper
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'vim-indent-object'
Plug 'textobj-user'
Plug 'matchit.zip'
Plug 'Townk/vim-autoclose'
Plug 'justinmk/vim-sneak'
Plug 'vimwiki'
Plug 'jlanzarotta/bufexplorer'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
let g:vimwiki_list = [{'syntax': 'markdown', 'ext': '.md'}]

" Snippets - we'll see if I actually use them.
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'charles-l/vim-snippets-crystal'

" Lisp
Plug 'guns/vim-sexp'

"Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'textobj-rubyblock'

"C
Plug 'scrooloose/syntastic'

"Crystal
Plug 'rhysd/vim-crystal'

call plug#end()

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
let g:netrw_browse_split = 0

"Strip trailing whitespace when writing a file
autocmd BufWritePre * :%s/\s\+$//e

"Move windows with C-Direction
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
inoremap <C-F> <C-X><C-F>

" better tabs
nmap <silent> <Space>n :tabn<CR>
nmap <silent> <Space>p :tabp<CR>

nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <leader>o :FZF<CR>
nnoremap <silent> <leader>t :NERDTreeToggle<CR>
nnoremap <silent> <leader>d :Ack <C-R><C-W><CR>

nnoremap <leader>r yyp!!sh<CR>
vnoremap . :norm.<CR>

" SYNTAX
au VimEnter * RainbowParentheses
let g:rainbow#blacklist = [224, 7]

" chicken scheme stuff. TODO: move to .vim file
au filetype scheme call SetSchemeOptions()
function SetSchemeOptions()
    let b:delimitMate_quotes = "\""
    setl complete+=,k~/.scheme-word-list
    setl include=\^\(\\(use\\\|require-extension\\)\\s\\+
    setl includeexpr=substitute(v:fname,'$','.scm','')
    setl path+=/usr/local/lib/chicken/7/
    setl suffixesadd+=.scm
    setl lispwords+=let-values,condition-case,with-input-from-string
    setl lispwords+=with-output-to-string,handle-exceptions,call/cc,rec,receive
    setl lispwords+=call-with-output-file
    nmap <silent> == :call Scheme_indent_top_sexp()<cr>
    let b:is_chicken=1

    " Indent a toplevel sexp.
    fun! Scheme_indent_top_sexp()
        let pos = getpos('.')
        silent! exec "normal! 99[(=%"
        call setpos('.', pos)
    endfun

    nmap <silent> <leader>es :call Scheme_eval_defun()<cr>
    nmap <silent> <leader>ef :call Scheme_send_sexp("(load \"" . expand("%:p") . "\")\n")<cr>

    fun! Scheme_send_sexp(sexp)
        let ss = escape(a:sexp, '\"')
        call system("tmux select-pane -D && tmux send-keys \"" . ss . "\n\"")
    endfun

    fun! Scheme_eval_defun()
        let pos = getpos('.')
        silent! exec "normal! 99[(yab"
        call Scheme_send_sexp(@")
        call setpos('.', pos)
    endfun
endfunction

set background=dark
colorscheme bwop
