"Boilerplate to enable Vundle
call plug#begin('~/.vim/plugged')

Plug 'flazz/vim-colorschemes' "I can't choose!!!
Plug 'gastonsimone/vim-dokumentary'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/rainbow_parentheses.vim' "Makes working with lisp easier
Plug 'junegunn/vim-oblique'
Plug 'junegunn/vim-pseudocl'
Plug 'kien/ctrlp.vim', {'on': ['CtrlP', 'CtrlPBuffer']}
Plug 'mileszs/ack.vim'
Plug 'mtth/scratch.vim'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'tpope/vim-fugitive' "Git wrapper
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'

"Ruby
Plug 'vim-ruby/vim-ruby'

call plug#end()
