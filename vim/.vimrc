set nocompatible
syntax enable
filetype plugin indent on

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive' "Git wrapper
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'narrow'
Plug 'vim-indent-object'
Plug 'textobj-user'
Plug 'junegunn/goyo.vim'
Plug 'matchit.zip'
Plug 'Raimondi/delimitMate'
Plug 'vimwiki'
Plug 'junegunn/vim-slash'
let g:nofrils_strbackgrounds=1
Plug 'robertmeta/nofrils'
let g:vimwiki_list = [{'syntax': 'markdown', 'ext': '.md'}]
Plug 'jlanzarotta/bufexplorer'
Plug 'sjl/gundo.vim'

" Ruby
Plug 'vim-ruby/vim-ruby'

" Lisp
Plug 'sjl/tslime.vim'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'

" C
Plug 'w0rp/ale'
Plug 'FSwitch'

" Go
Plug 'fatih/vim-go'

" APL
Plug 'ngn/vim-apl'

" Haskell
Plug 'bitc/vim-hdevtools'

" OCaml
Plug 'ocaml/merlin'

call plug#end()

"""

let mapleader = ","

set backspace=2
set laststatus=1
set shiftwidth=4
set tabstop=4
set modeline
set modelines=5
set nonumber expandtab smarttab autoindent smartindent hidden nowrap nobackup noswapfile
set path+=**
set wildmenu
set synmaxcol=200
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_liststyle = 3
let g:netrw_list_hide = netrw_gitignore#Hide()

"Strip trailing whitespace when writing a file
au BufWritePre * :%s/\s\+$//e

"Move windows with C-Direction
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <leader>o :find<space>
nnoremap <silent> <leader>t :vsplit .<CR>
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
    set lisp
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

" Haskell
au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>

" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line

if has("gui_running")
    colorscheme nofrils-dark
    set background=dark
    set guioptions-=T
    set guioptions-=L
    set guioptions-=r
    set guioptions-=m
else
    colorscheme nofrils-light
    set background=light
endif

