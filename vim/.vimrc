set nocompatible
syntax enable
filetype plugin indent on

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive' "Git wrapper
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'mbbill/undotree'
Plug 'markonm/traces.vim'
Plug 'vim-indent-object'
Plug 'textobj-user'
Plug 'reedes/vim-wordy'
Plug 'reedes/vim-pencil'
Plug 'matchit.zip'
Plug 'Raimondi/delimitMate'
Plug 'vimwiki'
Plug 'junegunn/vim-slash'
let g:nofrils_strbackgrounds=1
Plug 'robertmeta/nofrils'
let g:vimwiki_list = [{'syntax': 'markdown', 'ext': '.md'}]
Plug 'jlanzarotta/bufexplorer'
Plug 'ludovicchabant/vim-gutentags'

Plug 'jgdavey/tslime.vim'
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars

" Lisp
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'

" C
Plug 'w0rp/ale'
Plug 'FSwitch'
Plug 'skywind3000/asyncrun.vim'

" D
autocmd FileType d set efm=%*[^@]@%f\(%l\):\ %m,%f\(%l\\,%c\):\ %m,%f\(%l\):\ %m
let g:SuperTabDefaultCompletionType = '<C-X><C-O>'

Plug 'idanarye/vim-dutyl'
Plug 'ervandew/supertab'


" OCaml
Plug 'ocaml/merlin'

" Racket
Plug 'wlangstroth/vim-racket'
Plug 'vim-scripts/scribble.vim'

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

function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction

nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <leader>o :find<space>
nnoremap <silent> <leader>f :call ToggleVExplorer()<CR>
nnoremap <silent> <leader>a :FSHere<CR>
nnoremap <silent> <leader>m :AsyncRun -program=make<CR>
nnoremap <silent> <leader>e :call asyncrun#quickfix_toggle(6)<cr>

nnoremap <leader>r yyp!!sh<CR>
vnoremap . :norm.<CR>

packadd termdebug

autocmd FileType lisp,racket,scheme :iabbrev .\ λ
autocmd FileType lisp,racket,scheme :iabbrev (.\ (λ<DEL>
autocmd FileType lisp,racket,scheme let b:delimitMate_quotes = "\""

func! WordProcessorMode()
    setlocal formatoptions+=l
    setlocal noexpandtab
    iabbrev <buffer> -- –
    iabbrev <buffer> --- —
    execute "TogglePencil"
    execute "Wordy weak"
endfu

map <F11> :call WordProcessorMode()<CR>

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

if executable("ack")
    set grepprg=ack\ -H\ --nocolor\ --nogroup\ --column
    set grepformat=%f:%l:%c:%m
endif

if has("gui_running")
    colorscheme nofrils-light
    set background=light
    set guioptions-=T
    set guioptions-=L
    set guioptions-=r
    set guioptions-=m
else
    colorscheme nofrils-light
    set background=light
endif

