"Boilerplate to enable Vundle
call plug#begin('~/.vim/plugged')

Plug 'gastonsimone/vim-dokumentary'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/rainbow_parentheses.vim' "Makes working with lisp easier
Plug 'junegunn/vim-oblique'
Plug 'junegunn/vim-pseudocl'
Plug 'kana/vim-fakeclip'
Plug 'kien/ctrlp.vim', {'on': ['CtrlP', 'CtrlPBuffer']}
Plug 'mileszs/ack.vim'
Plug 'mtth/scratch.vim'
"Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'tpope/vim-fugitive' "Git wrapper
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'ViewPort'
Plug 'vim-indent-object'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'terryma/vim-multiple-cursors'
Plug 'kovisoft/paredit'

"Ruby
Plug 'vim-ruby/vim-ruby'

call plug#end()
