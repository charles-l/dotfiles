"Boilerplate to enable Vundle
call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-oblique'
Plug 'tpope/vim-fugitive' "Git wrapper
Plug 'kien/ctrlp.vim', {'on': ['CtrlP', 'CtrlPBuffer']}
Plug 'kien/rainbow_parentheses.vim' "Makes working with lisp easier
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-sleuth'
Plug 'gastonsimone/vim-dokumentary'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-repeat'
Plug 'Lokaltog/vim-distinguished'

"Ruby
Plug 'vim-ruby/vim-ruby'

call plug#end()
