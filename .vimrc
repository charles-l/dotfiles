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
Plugin 'kien/ctrlp.vim'  "Fuzzy searching if dmenu isn't avaliable
Plugin 'kien/rainbow_parentheses.vim' "Makes working with lisp easier
Plugin 'wgibbs/vim-irblack' "Nice, low contrast color scheme
Plugin 'mtth/scratch.vim' " For taking notes or as a temp buffer for pasting crap
Plugin 'fatih/vim-go' "Because vim stuff that comes with go is crap

call vundle#end()

"""""""""""""""""
" PLUGIN CONFIG "
"""""""""""""""""
"Configure file browser
let g:netrw_browse_split = 0

"Configure syntastic
let g:syntastic_c_include_dirs = [ '/usr/local/include']

" Rainbow parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:rbpt_colorpairs = [
        \ ['brown',       'RoyalBlue3'],
        \ ['Darkblue',    'SeaGreen3'],
        \ ['darkgray',    'DarkOrchid3'],
        \ ['darkgreen',   'firebrick3'],
        \ ['darkcyan',    'RoyalBlue3'],
        \ ['darkred',     'SeaGreen3'],
        \ ['darkmagenta', 'DarkOrchid3'],
        \ ['brown',       'firebrick3'],
        \ ['gray',        'RoyalBlue3'],
        \ ['green',       'SeaGreen3'],
        \ ['darkmagenta', 'DarkOrchid3'],
        \ ['Darkblue',    'firebrick3'],
        \ ['darkgreen',   'RoyalBlue3'],
        \ ['darkcyan',    'SeaGreen3'],
        \ ['darkred',     'DarkOrchid3'],
        \ ['red',         'firebrick3'],
        \ ]

"""""""""""""""""""""""
" BASIC CONFIGURATION "
"""""""""""""""""""""""

let mapleader = ","

set t_Co=256 "MORE COLORS
set encoding=utf-8
set fenc=utf-8
set termencoding=utf-8
set shiftwidth=8
set tabstop=8
set softtabstop=8
set backspace=2
set laststatus=2
set number expandtab smarttab autoindent smartindent hidden nowrap autochdir

syntax enable
colorscheme ir_black

" Minor highlight tweaks
highlight clear SignColumn
highlight Pmenu ctermbg=DarkGrey ctermfg=White

"Strip trailing whitespace when writing a file
autocmd BufWritePre * :%s/\s\+$//e

" Change cursor shape
if &term == 'xterm-256color' || &term == 'screen-256color'
        let &t_SI = "\<Esc>[5 q"
        let &t_EI = "\<Esc>[1 q"
endif
if exists('$TMUX')
        let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
        let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
endif

""""""""ANNOYANCES""""""""
" Don't jump when I merge lines
nnoremap J mzJ`z
nnoremap n nzz
nnoremap } }zz
" Don't jump over wrapped lines
nnoremap j gj
nnoremap k gk
" Remove commonly bumped commands
nnoremap <F1> <nop>
nnoremap Q <nop>
nnoremap K <nop>
" Short startup messages
set shortmess+=I
set showmode
set smartcase
" Global search by default
set gdefault
set virtualedit=block
set wildmode=longest,list
nnoremap Y y$
" Don't tab complete binary files
set wildignore+=*.a,*.o
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
set wildignore+=.DS_Store,.git,.hg,.svn
set wildignore+=*~,*.swp,*.tmp

" Remove useless backup files
set nobackup nowritebackup

" Very rarely does anyone need swap files anymore
set noswapfile

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
"Modified to allow for Ctrl-P if dmenu isn't installed.
function! DmenuOpen(cmd)
        "If in git repo, search get. Else recursive search. find is insanely fast.
        if filereadable("/bin/dmenu") || filereadable("/usr/bin/dmenu")
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
        else
                :CtrlP
        end
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
nnoremap <silent> <leader>f :Exp<CR>
nnoremap <silent> <leader>a :call SwapSourceFile("e")<CR>
nnoremap <silent> <leader>t :TlistToggle<CR>
nnoremap <silent> <leader>s :Scratch<CR>
nnoremap <silent> [b :bp<CR>
nnoremap <silent> ]b :bn<CR>
nnoremap <leader>b :ls<CR>:b<Space>
inoremap <C-F> <C-X><C-F>

"Move windows with C-Direction
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l
