"Basic settings
set nocompatible
filetype plugin indent on

"Boilerplate to enable Vundle
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'gmarik/Vundle.vim' "Plugin Manager
Plugin 'taglist.vim' "Source code browser
Plugin 'tpope/vim-fugitive' "Git wrapper
Plugin 'scrooloose/syntastic' "Syntax checking

call vundle#end()

"Configure file browser
let g:netrw_browse_split = 4
let g:netrw_altv = 1

let mapleader = "," "Change the leader key to ','

set t_Co=256 "MORE COLORS
set encoding=utf-8
set fenc=utf-8
set termencoding=utf-8
set number
set expandtab
set shiftwidth=8
set smarttab
set autoindent
set smartindent
set tabstop=8
set hidden
set softtabstop=8
set nowrap
set backspace=2
set laststatus=2
set autochdir
highlight clear SignColumn

"I never found the backup files useful.
set nobackup
set nowritebackup

"I don't really need swapfiles (disable unless you happen to work with really large
"files and limited memory)
set noswapfile

syntax enable

"Strip trailing whitespace when writing a file
autocmd BufWritePre * :%s/\s\+$//e

autocmd FileType c,h,cpp,hpp set omnifunc=omni#cpp#complete#Main

""""""""""""""""""
" UTIL FUNCTIONS "
""""""""""""""""""
function! Chomp(str)
  return substitute(a:str, '\n$', '', '')
endfunction

""""""""""""""""""
" FILE SEARCHING "
""""""""""""""""""
"Shamelessly taken from http://leafo.net/posts/using_dmenu_to_open_quickly.html
function! DmenuOpen(cmd)
  "If in git repo, search get. Else recursive search. find is insanely fast.
  if strlen(Chomp(system("[ -d .git ] || git rev-parse --git-dir > /dev/null 2>&1"))) > 0
    echo "Finding in git repo"
    let fname = Chomp(system("git ls-files | dmenu -i -l 20 -p " . a:cmd))
  else
    echo "Finding in all subdirectories"
    let fname = Chomp(system("find . -not -iwholename '*.git*'| dmenu -i -l 20 -p " . a:cmd))
  end
  if empty(fname)
    return
  endif
  execute a:cmd . " " . fname
endfunction

"""""""""""""""""""""""""""""""""""
" SWAP BETWEEN HEADER AND C FILES "
"""""""""""""""""""""""""""""""""""
function! SwapSourceFile(cmd)
  let curfile = split(@%, '\.')
  if len(curfile) > 1
    if curfile[1] == "c" || curfile[1] == "cc"
      let target = "h"
    elseif curfile[1] == "h"
      let target = "c"
    elseif curfile[1] == "hpp"
      let target = "cpp"
    elseif curfile[1] == "cpp"
      let target = "hpp"
    else
      echo "Unrecognized file type"
      return
    endif
    execute a:cmd . " " .  curfile[0] . "." . target
  endif
endfunction

""""""""""""""""""
" KEYBOARD BINDS "
""""""""""""""""""
nnoremap <silent> <leader>o :call DmenuOpen("e")<CR>
nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <leader>f :split<CR>:Exp<CR>
nnoremap <silent> <leader>a :call SwapSourceFile("e")<CR>
nnoremap <silent> <leader>t :TlistToggle<CR>
nnoremap <silent> [b :bp<CR>
nnoremap <silent> ]b :bn<CR>
nnoremap <leader>b :ls<CR>:b<Space>

"Move windows with C-Direction
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l
