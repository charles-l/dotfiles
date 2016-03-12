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
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
inoremap <C-F> <C-X><C-F>

" better tabs
nmap <silent> <Space>n :tabn<CR>
nmap <silent> <Space>p :tabp<CR>

nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <leader>b :CtrlPBuffer<CR>
nnoremap <silent> <leader>o :CtrlP<CR>
nnoremap <silent> <leader>t :NERDTreeToggle<CR>
nnoremap <silent> <leader>m :term make<CR>
nnoremap <silent> <leader>d :Ack <C-R><C-W><CR>
nnoremap <silent> <leader>a :A <CR>
nnoremap <silent> <leader>s :Scratch<CR>
"insert timestamp
nnoremap <silent> <F5> O<ESC>:read !date "+\%Y-\%m-\%d \%H:\%m:\%S"<CR>kdd

vmap     <silent> S :MultipleCursorsFind<Space>

nnoremap <leader>r yyp!!sh<CR>
nnoremap <leader>R :let x=getline('.') \| vnew \| execute 'term '.x <CR>

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
