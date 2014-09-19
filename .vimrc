"Basic settings
set nocompatible
filetype plugin indent on

"Boilerplate to enable Vundle
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'gmarik/Vundle.vim' "Plugin Manager
Plugin 'taglist.vim' "Source code browser
Plugin 'flazz/vim-colorschemes' "THEMES!
Plugin 'tpope/vim-fugitive' "Git wrapper
Plugin 'scrooloose/syntastic' "Syntax checking
Plugin 'Rip-Rip/clang_complete' "Clang completion

call vundle#end()

let g:clang_library_path='/usr/lib/llvm-3.4/lib/'
let g:clang_snippets=1

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
set cursorline
set shiftwidth=2
set smarttab
set autoindent
set smartindent
set tabstop=4
set hidden
set softtabstop=2
set nowrap
set backspace=2
set laststatus=2
set autochdir
set omnifunc=syntaxcomplete#Complete
highlight clear SignColumn

"I never found the backup files useful.
set nobackup
set nowritebackup

"I don't really need swapfiles (disable unless you happen to work with really large
"files and limited memory)
set noswapfile

syntax enable
colorscheme jellybeans

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

""""""""""""""""
" TAB COMPLETE "
""""""""""""""""
function! SmartTabComplete()
  let line = getline('.')

  let substr = strpart(line, -1, col('.')+1)
  let substr = matchstr(substr, "[^ \t]*$")
  if (strlen(substr)==0)
    return "\<Tab>"
  endif
  let has_period = match(substr, '\.') != -1
  let has_slash = match(substr, '\/') != -1
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"
  elseif ( has_slash )
    return "\<C-X>\<C-F>"
  else
    return "\<C-X>\<C-O>"
  endif
endfunction

"""""""""""""""""""
" BRACKET CLOSING "
"""""""""""""""""""
let matches = split("[:],{:},(:),\":\",':',/*:*/,`:`", ",")
for i in range(len(matches))
  let o = split(matches[i], ":")[0]
  let c = split(matches[i], ":")[1]
  execute 'inoremap ' . o . ' ' . o . c . '<Left>'
  execute 'inoremap ' . o . '<CR> ' . o . '<CR>' . c . '<Esc>O'
  execute 'inoremap ' . o . '<Space>' . ' ' . o . '<Space><Space>' . c . '<Left><Left>'
  execute 'inoremap ' . o . c . ' ' . o . c
endfor

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

inoremap <Tab>    <c-r>=SmartTabComplete()<CR>

"Move windows with C-Direction
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l
