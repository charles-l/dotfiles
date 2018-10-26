set nocompatible
syntax enable
filetype plugin indent on

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive' "Git wrapper
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'mbbill/undotree'
Plug 'markonm/traces.vim' " nicer search/replace
Plug 'vim-scripts/vim-indent-object'
Plug 'vim-scripts/textobj-user'
Plug 'vim-scripts/matchit.zip'
Plug 'Raimondi/delimitMate'
Plug 'junegunn/vim-slash'
let g:nofrils_strbackgrounds=1
Plug 'robertmeta/nofrils'
Plug 'jlanzarotta/bufexplorer'

Plug 'jgdavey/tslime.vim'
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars

" Lisp
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'

" C
Plug 'w0rp/ale'
Plug 'vim-scripts/FSwitch'
Plug 'skywind3000/asyncrun.vim'

" D
autocmd FileType d set efm=%*[^@]@%f\(%l\):\ %m,%f\(%l\\,%c\):\ %m,%f\(%l\):\ %m
let g:SuperTabDefaultCompletionType = '<C-X><C-O>'

Plug 'idanarye/vim-dutyl'
Plug 'ervandew/supertab'


" Racket
Plug 'wlangstroth/vim-racket'

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
    colorscheme nofrils-dark
    set background=dark
endif

